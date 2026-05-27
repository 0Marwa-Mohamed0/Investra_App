from fastapi import FastAPI, UploadFile, File, Form
from fastapi.middleware.cors import CORSMiddleware
from pptx import Presentation
from openai import OpenAI
from supabase import create_client
from dotenv import load_dotenv
from docx import Document
import PyPDF2
import pandas as pd
import os
import io
import json
import uuid
from datetime import datetime, timezone

app = FastAPI()
load_dotenv()

OPENROUTER_API_KEY = os.getenv("OPENROUTER_API_KEY")
SUPABASE_URL = os.getenv("SUPABASE_URL")
SUPABASE_KEY = os.getenv("SUPABASE_KEY")

supabase = create_client(SUPABASE_URL, SUPABASE_KEY)

client = OpenAI(
    base_url="https://openrouter.ai/api/v1",
    api_key=OPENROUTER_API_KEY
)

MODEL_NAME = "openai/gpt-4o-mini"

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

# ============================================================
# دالة توليد عنوان المحادثة (جديدة)
# ============================================================
def generate_chat_title(message):
    try:
        prompt = f"Generate a very short, concise title (max 5 words) for a chat conversation based on this user message: '{message}'. Return only the title text."
        response = client.chat.completions.create(
            model=MODEL_NAME,
            messages=[{"role": "user", "content": prompt}],
            max_tokens=20,
        )
        return response.choices[0].message.content.strip().replace('"', '')
    except Exception as e:
        print(f"Error generating title: {e}")
        return message[:50]  # احتياطي

# ============================================================
# دالة تنظيف UUID
# ============================================================
def clean_uuid(value):
    if not value:
        return None
    cleaned = str(value).strip()
    if cleaned in ["", "0", "string", "null", "none", "undefined"]:
        return None
    return cleaned

# ============================================================
# دوال استخراج النص من الملفات
# ============================================================
def extract_text_from_pptx(file_bytes):
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

def extract_text_from_docx(file_bytes):
    doc = Document(io.BytesIO(file_bytes))
    return "\n".join([para.text for para in doc.paragraphs])

def extract_text_from_pdf(file_bytes):
    pdf_reader = PyPDF2.PdfReader(io.BytesIO(file_bytes))
    text = ""
    for page in pdf_reader.pages:
        page_text = page.extract_text()
        if page_text:
            text += page_text + "\n"
    return text

def extract_text_from_excel(file_bytes):
    df = pd.read_excel(io.BytesIO(file_bytes))
    return df.to_string()

def build_evaluation_prompt(extracted_text):
    return f"""
You are an expert business analyst and investment advisor evaluating a startup pitch deck.
Analyze the following content and provide:
1. Overall Rating (out of 5) -> Format your first line EXACTLY like this: "Rating: X.X"
... (بقية الـ prompt الخاص بك)
--- CONTENT TO EVALUATE ---
{extracted_text}
---
"""

# ============================================================
# /evaluate
# ============================================================
@app.post("/evaluate")
async def evaluate_pitch(
    file: UploadFile = File(...),
    idea_id: str = Form(None),
    user_id: str = Form(None)
):
    # ... (نفس منطقك السابق في evaluate) ...
    # (تم اختصارها هنا لتوفير المساحة، يمكنك نسخها من كودك الأصلي)
    return {"status": "success"} # تذكير: تأكد من نسخ منطقك هنا كاملاً

# ============================================================
# /chat — المحادثة (تم دمج منطق العنوان الذكي)
# ============================================================
@app.post("/chat")
async def chat(
    message: str = Form(...),
    history: str = Form(default="[]"),
    session_id: str = Form(default=None),
    user_id: str = Form(default=None)
):
    session_id = clean_uuid(session_id)
    user_id = clean_uuid(user_id)

    try:
        chat_history = json.loads(history) if history and history.strip() not in ["", "[]"] else []
    except:
        chat_history = []

    messages = [
        {
            "role": "system",
            "content": """You are an AI assistant specialized in business analysis, 
            startup evaluation, and connecting entrepreneurs with investors."""
        }
    ]

    for msg in chat_history[-10:]:
        messages.append(msg)

    messages.append({"role": "user", "content": message})

    response = client.chat.completions.create(
        model=MODEL_NAME,
        messages=messages,
        max_tokens=1000,
    )

    ai_response = response.choices[0].message.content
    current_time = datetime.now(timezone.utc).isoformat()

    # 1. تحديث الـ Session مع توليد عنوان ذكي
    if not session_id:
        smart_title = generate_chat_title(message) # <--- هنا تمت الإضافة
        session_data = supabase.table("AI_Sessions").insert({
            "session_id": str(uuid.uuid4()),
            "user_id": user_id,
            "title": smart_title, # استخدام العنوان الذكي
            "last_message_snippet": ai_response[:100],
        }).execute()
        session_id = session_data.data[0]["session_id"]
    else:
        supabase.table("AI_Sessions").update({
            "last_message_snippet": ai_response[:100],
            "updated_at": current_time
        }).eq("session_id", session_id).execute()

    # 2. حفظ رد الـ AI في AI_Messages
    supabase.table("AI_Messages").insert({
        "message_id": str(uuid.uuid4()),
        "session_id": session_id,
        "sender_role": "assistant",
        "content": ai_response,
        "created_at": current_time
    }).execute()

    return {
        "response": ai_response,
        "session_id": session_id
    }

# ============================================================
# بقية الدوال (rate-ideas, test-read)
# ============================================================
# ... (يمكنك ترك باقي الدوال كما هي) ...

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=8000)
