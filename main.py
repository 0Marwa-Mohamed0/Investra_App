from fastapi import FastAPI, UploadFile, File, Form
from fastapi.middleware.cors import CORSMiddleware
from pptx import Presentation
from openai import OpenAI
from dotenv import load_dotenv
from docx import Document
import PyPDF2
import pandas as pd
import os
import io
import json
app = FastAPI()
load_dotenv()
client = OpenAI(base_url="https://openrouter.ai/api/v1", api_key=os.getenv("OPENROUTER_API_KEY"))
# السماح لـ Flutter بالتواصل مع الـ Backend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)



# ---- دالة استخراج النص من PowerPoint ----
def extract_text_from_pptx(file_bytes: bytes) -> str:
    prs = Presentation(io.BytesIO(file_bytes))
    full_text = []
    
    for slide_num, slide in enumerate(prs.slides, 1):
        slide_texts = []
        for shape in slide.shapes:
            if hasattr(shape, "text") and shape.text.strip():
                slide_texts.append(shape.text.strip())
        if slide_texts:
            full_text.append(f"[Slide {slide_num}]\n" + "\n".join(slide_texts))
    
    return "\n\n".join(full_text)

# ---- دالة استخراج النص من Word ----
def extract_text_from_docx(file_bytes: bytes) -> str:
    doc = Document(io.BytesIO(file_bytes))
    return "\n".join([para.text for para in doc.paragraphs])

# ---- دالة استخراج النص من PDF ----
def extract_text_from_pdf(file_bytes: bytes) -> str:
    pdf_reader = PyPDF2.PdfReader(io.BytesIO(file_bytes))
    text = ""
    for page in pdf_reader.pages:
        page_text = page.extract_text()
        if page_text:
            text += page_text + "\n"
    return text

# ---- دالة استخراج النص من Excel ----
def extract_text_from_excel(file_bytes: bytes) -> str:
    df = pd.read_excel(io.BytesIO(file_bytes))
    return df.to_string()

# ---- Prompt التقييم الاحترافي ----
def build_evaluation_prompt(extracted_text: str) -> str:
    return f"""
You are an expert business analyst and investment advisor evaluating a startup pitch deck.

Analyze the following presentation/content and provide:

1. *Overall Rating* (out of 10)
2. *Business Analytics Score* (out of 10) with explanation
3. *Marketing Plan Score* (out of 10) with explanation
4. *Strengths* (3-5 points)
5. *Weaknesses* (3-5 points)
6. *Investor Attractiveness* (High / Medium / Low) with reason
7. *Recommendations* for improvement

Be specific, professional, and data-driven. If any section is missing from the content, mention it clearly.

--- CONTENT TO EVALUATE ---
{extracted_text}
---

Respond in the same language the content is written in.
"""

# ---- Endpoint: تقييم الملف (يدعم PowerPoint, Word, PDF, Excel) ----
@app.post("/evaluate")
async def evaluate_pitch(file: UploadFile = File(...)):
    # قراءة الملف
    file_bytes = await file.read()
    filename = file.filename.lower()
    extracted_text = ""

    # تحديد نوع الملف واستخراج النص المناسب
    if filename.endswith(".pptx"):
        extracted_text = extract_text_from_pptx(file_bytes)
    elif filename.endswith(".docx"):
        extracted_text = extract_text_from_docx(file_bytes)
    elif filename.endswith(".pdf"):
        extracted_text = extract_text_from_pdf(file_bytes)
    elif filename.endswith((".xlsx", ".xls")):
        extracted_text = extract_text_from_excel(file_bytes)
    else:
        return {"error": "نوع الملف غير مدعوم حالياً. الأنواع المدعومة: .pptx, .docx, .pdf, .xlsx, .xls"}

    # التحقق من نجاح استخراج النص
    if not extracted_text.strip():
        return {"error": "Could not extract text from the file. Make sure it's a valid file with readable content."}
    
    # إرسال لـ OpenRouter للتقييم
    response = client.chat.completions.create(
        model="openai/gpt-4o-mini",
        messages=[
            {
                "role": "system",
                "content": "You are a professional startup evaluator helping investors find the best business ideas."
            },
            {
                "role": "user",
                "content": build_evaluation_prompt(extracted_text)
            }
        ],
        max_tokens=2000,
    )
    
    result = response.choices[0].message.content
    
    # حساب عدد الأقسام (لـ PowerPoint فقط)
    slides_count = extracted_text.count("[Slide") if filename.endswith(".pptx") else 0
    
    return {
        "filename": filename,
        "evaluation": result,
        "content_length": len(extracted_text),
        "slides_analyzed": slides_count if slides_count > 0 else None,
        "status": "success"
    }

# ---- Endpoint: Chat عادي (سؤال وجواب) ----
@app.post("/chat")
async def chat(message: str = Form(...), history: str = Form(default="[]")):
    chat_history = json.loads(history)
    
    messages = [
        {
            "role": "system",
            "content": """You are an AI assistant specialized in business analysis, 
            startup evaluation, and connecting entrepreneurs with investors. 
            Help users improve their business ideas and pitch decks."""
        }
    ]
    
    # إضافة تاريخ المحادثة (آخر 10 رسائل فقط)
    for msg in chat_history[-10:]:
        messages.append(msg)
    
    messages.append({"role": "user", "content": message})
    
    response = client.chat.completions.create(
        model="openai/gpt-4o-mini",
        messages=messages,
        max_tokens=1000,
    )
    
    return {"response": response.choices[0].message.content}

# ---- Endpoint: اختبار قراءة الملف (للتجربة فقط) ----
@app.post("/test-read")
async def test_read(file: UploadFile = File(...)):
    """Endpoint تجريبي لاختبار قراءة الملفات بدون إرسال لـ AI"""
    file_bytes = await file.read()
    filename = file.filename.lower()
    extracted_text = ""

    if filename.endswith(".pptx"):
        extracted_text = extract_text_from_pptx(file_bytes)
    elif filename.endswith(".docx"):
        extracted_text = extract_text_from_docx(file_bytes)
    elif filename.endswith(".pdf"):
        extracted_text = extract_text_from_pdf(file_bytes)
    elif filename.endswith((".xlsx", ".xls")):
        extracted_text = extract_text_from_excel(file_bytes)
    else:
        return {"error": "نوع الملف غير مدعوم حالياً."}

    return {
        "filename": filename,
        "content_preview": extracted_text[:500],  # عرض أول 500 حرف للتجربة
        "content_length": len(extracted_text),
        "status": "success"
    }

# ---- تشغيل السيرفر ----
if __name__ == "_main_":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
