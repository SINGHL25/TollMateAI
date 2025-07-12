# 🔧 FILE: src/detectors.py
import pandas as pd  # 🔧 Add this line
def detect_lpn_mismatch(df_passage):
    return df_passage[(df_passage['Front State Code'] != df_passage['Rear State Code']) &
                      (df_passage['Front State Code'].notna()) &
                      (df_passage['Rear State Code'].notna())]

def detect_missing_tags(df_transaction):
    return df_transaction[df_transaction['Serial Number'] == 0]

def calculate_revenue_loss(df_transaction):
    missing = detect_missing_tags(df_transaction)
    unmatched = df_transaction[df_transaction['Matched'] == 'No']
    unsuccessful = df_transaction[df_transaction['Transaction Completed'] == 'No']
    all_loss = pd.concat([missing, unmatched, unsuccessful]).drop_duplicates()
    all_loss['Estimated Loss'] = 5.0  # Dummy amount per missed toll
    return all_loss
