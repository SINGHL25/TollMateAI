// ✅ FASTAPI ENDPOINT IN backend/src/routers/kpi_router.py

from fastapi import APIRouter
from pymongo import MongoClient

router = APIRouter()

@router.get("/kpi")
def get_kpi_data():
    client = MongoClient("<your-mongodb-uri>")
    db = client["tollmate"]

    frauds = db.transactions.count_documents({"Matched": "No"})
    density = db.transactions.count_documents({})
    tag_missing = db.transactions.count_documents({"Contract Provider": {"$in": ["", None]}})

    return {
        "Frauds": frauds,
        "Density": density,
        "Tags Missing": tag_missing,
        "Revenue Loss": frauds * 5  # ₹5 loss per missed match (example)
    }
