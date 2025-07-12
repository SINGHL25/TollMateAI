# 🔧 FILE: mongodb_integration/api.py

from fastapi import FastAPI, File, UploadFile
import pandas as pd
from mongodb_integration.mongo_config import get_database
from mongodb_integration.models.data_model import create_transaction_document, create_passage_document
from fastapi.responses import JSONResponse

app = FastAPI()
db = get_database()

@app.post("/upload/transaction")
async def upload_transaction(file: UploadFile = File(...)):
    df = pd.read_excel(file.file)
    docs = [create_transaction_document(row) for _, row in df.iterrows()]
    db.transactions.insert_many(docs)
    return JSONResponse(content={"status": "uploaded", "count": len(docs)})

@app.post("/upload/passage")
async def upload_passage(file: UploadFile = File(...)):
    df = pd.read_excel(file.file)
    docs = [create_passage_document(row) for _, row in df.iterrows()]
    db.passages.insert_many(docs)
    return JSONResponse(content={"status": "uploaded", "count": len(docs)})
