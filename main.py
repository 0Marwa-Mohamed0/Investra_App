from fastapi import FastAPI, UploadFile, File, Form
from fastapi.middleware.cors import CORSMiddleware
from openai import OpenAI
from supabase import create_client
from dotenv import load_dotenv
import os
import uuid
import json
from pydantic import BaseModel

app = FastAPI()
load_dotenv()

# إعدادات الاتصال
supabase = create_client(os.getenv("SUPABASE_URL"), os.getenv("SUPABASE_KEY"))
client = OpenAI(base_url="https://openrouter.ai/api/v1", api_key=os.getenv("OPENROUTER_API_KEY"))
MODEL_NAME = "openai/gpt-4o-mini"

app.add_middleware(CORSMiddleware, allow_origins=["*"], allow_methods=["*"], allow_headers=["*"])

def clean_uuid(value):
    return str(value).strip() if value and str(value).strip() not in ["null", "undefined", "none"] else None

@app.post("/chat")
async def chat(data: ChatInput):
    message = data.message
    session_id = clean_uuid(data.session_id)
    user_id = clean_uuid(data.user_id)
    
    # 1. إذا كانت جلسة جديدة، ننشئها ونضع رسالة الترحيب
    if not session_id:
        session_id = str(uuid.uuid4())
        # جلب اسم المستخدم للترحيب
        user_name = "User"
        user_res = supabase.table("User").select("FullName").eq("userid", user_id).maybe_single().execute()
        if user_res.data: user_name = user_res.data.get("FullName", "User")
        
        supabase.table("AI_Sessions").insert({"session_id": session_id, "user_id": user_id, "title": message[:50]}).execute()
        supabase.table("AI_Messages").insert({
            "message_id": str(uuid.uuid4()), "session_id": session_id, 
            "sender_role": "assistant", "content": f"Hi {user_name}, I am your Investra AI\nhow can I help you today"
        }).execute()

    # 2. استكمال المحادثة مع الـ AI
    response = client.chat.completions.create(model=MODEL_NAME, messages=[{"role": "user", "content": message}])
    ai_response = response.choices[0].message.content

    # 3. حفظ الرسائل
    supabase.table("AI_Messages").insert([
        {"message_id": str(uuid.uuid4()), "session_id": session_id, "sender_role": "user", "content": message},
        {"message_id": str(uuid.uuid4()), "session_id": session_id, "sender_role": "assistant", "content": ai_response}
    ]).execute()

    return {"response": ai_response, "session_id": session_id}

# (ملاحظة: يمكنك إبقاء دالة /evaluate كما هي مع إضافة الـ session_id في الـ MultipartRequest من الفلاتر)
