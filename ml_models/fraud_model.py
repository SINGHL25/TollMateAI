import pandas as pd

def detect_fraud(df_transaction):
    fraud_cases = df_transaction[
        (df_transaction['Matched'] == 'No') |
        (df_transaction['Transaction Completed'] == 'No') |
        (df_transaction['Serial Number'] == 0)
    ]
    fraud_cases['fraud_type'] = fraud_cases.apply(lambda row: "Unmatched" if row['Matched'] == 'No' else (
        "Incomplete" if row['Transaction Completed'] == 'No' else "Invalid Serial"), axis=1)
    return fraud_cases

