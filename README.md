# TollMateAI
TollMateAI – Tolling Data Analyzer and KPI Dashboard     🔍 App Features: This web app will:  ✅ Ingest passage data and transaction data from .xlsx files.  ✅ Detect:  Front &amp; Rear LPN mismatches  Missing Tags  Unmatched transactions  Revenue loss estimations  ✅ Predict traffic density using timestamps &amp; lanes.  
# 🔧 FILE: README.md

# TollMateAI 🚧

**TollMateAI** is a Streamlit-powered dashboard that analyzes tolling passage and transaction data to identify:

- LPN mismatches (front vs rear license plates)
- Missing tags
- Unmatched / failed transactions
- Traffic density predictions
- Estimated revenue loss due to tag or matching issues

### 📁 Folder Structure
```
TollMateAI/
├── app.py
├── requirements.txt
├── README.md
├── data/
│   ├── passage_data.xlsx
│   └── transaction_data.xlsx
└── src/
    ├── data_loader.py
    ├── detectors.py
    ├── predictors.py
    └── visualizer.py
```

### 🚀 How to Run
```bash
pip install -r requirements.txt
streamlit run app.py
```

Upload your `.xlsx` files and start exploring your tolling data visually!
