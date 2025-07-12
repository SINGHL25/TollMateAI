# 🔧 FILE: ml_models/inference_api/fastapi_model_api.py

from fastapi import FastAPI, UploadFile, File
import pandas as pd
from ml_models.model_training.fraud_model import detect_fraud
from ml_models.model_training.density_predictor import predict_traffic_density
from fastapi.responses import JSONResponse

app = FastAPI()

@app.post("/model/fraud-detection")
async def fraud_detection(file: UploadFile = File(...)):
    df = pd.read_excel(file.file)
    fraud_df = detect_fraud(df)
    return JSONResponse(content={"fraud_count": len(fraud_df), "sample": fraud_df.head(5).to_dict(orient="records")})

@app.post("/model/traffic-density")
async def traffic_density(file: UploadFile = File(...)):
    df = pd.read_excel(file.file)
    density_df = predict_traffic_density(df)
    return JSONResponse(content={"density_rows": len(density_df), "sample": density_df.head(5).to_dict(orient="records")})
