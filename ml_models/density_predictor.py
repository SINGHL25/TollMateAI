# 🔧 FILE: ml_models/model_training/density_predictor.py

import pandas as pd

def predict_traffic_density(df_transaction):
    df = df_transaction.copy()
    df['Time Stamp'] = pd.to_datetime(df['Time Stamp'])
    df['Hour'] = df['Time Stamp'].dt.hour
    df['Date'] = df['Time Stamp'].dt.date

    density = df.groupby(['Date', 'Hour']).size().reset_index(name='Vehicle Count')
    return density
