🧱 Step-by-Step Setup Plan
✅ Step 1: Setup mongodb_integration/
We'll define:

MongoDB connection

Insert/query logic for passage + transaction data

APIs (Flask or FastAPI)

✅ Step 2: Setup ml_models/
fraud_model.py: detect anomalies like tag-missing, LPN mismatch, etc.

density_predictor.py: traffic density ML model

camera_validator.py: placeholder for image matching / confidence detection

✅ Step 3: Setup android_app_flutter/
Options:

Use Flutter + Streamlit WebView (for quick integration)

Or a native Android UI calling the backend APIs (phase 2)

✅ Starting Now: mongodb_integration/ Module

# ✅ MongoDB Atlas Setup Instructions

1. Go to: https://www.mongodb.com/cloud/atlas
2. Create a free cluster.
3. Create a database named: `tollmateai`
4. Create collections: `transactions`, `passages`
5. Create a database user and whitelist your IP address.
6. Replace the Mongo URI inside `mongo_config.py` with:
   ```
   mongodb+srv://<your_user>:<your_password>@<cluster-url>/tollmateai?retryWrites=true&w=majority
   ```
7. Run FastAPI:
   ```bash
   uvicorn mongodb_integration.api:app --reload --port 8000
   ```
