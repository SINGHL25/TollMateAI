# 🔧 FILE: src/predictors.py

def predict_traffic_density(df_transaction):
    df = df_transaction.copy()
    df['TS'] = pd.to_datetime(df['TS'])
    df['Hour'] = df['TS'].dt.hour
    df['Date'] = df['TS'].dt.date
    density = df.groupby(['Date', 'Hour']).size().reset_index(name='Vehicle Count')
    return density
