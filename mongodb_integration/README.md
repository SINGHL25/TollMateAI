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
