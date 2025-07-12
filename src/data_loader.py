# 🔧 FILE: src/data_loader.py

import pandas as pd

def load_passage_data(file):
    return pd.read_excel(file)

def load_transaction_data(file):
    return pd.read_excel(file)

