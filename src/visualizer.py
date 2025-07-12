# 🔧 FILE: src/visualizer.py

import streamlit as st
import seaborn as sns
import matplotlib.pyplot as plt

def plot_kpis(df_transaction, missing_tags, mismatches, revenue_loss):
    col1, col2, col3, col4 = st.columns(4)
    col1.metric("Total Transactions", len(df_transaction))
    col2.metric("Missing Tags", len(missing_tags))
    col3.metric("LPN Mismatches", len(mismatches))
    col4.metric("Estimated Revenue Loss", f"${revenue_loss['Estimated Loss'].sum():.2f}")

def plot_visuals(df_transaction, traffic_df):
    with st.expander("📊 Traffic Density Timeline"):
        plt.figure(figsize=(12, 4))
        sns.lineplot(data=traffic_df, x='Hour', y='Vehicle Count', hue='Date', marker='o')
        plt.title("Hourly Traffic Density")
        st.pyplot(plt.gcf())

    with st.expander("🚘 Vehicle Class Distribution"):
        plt.figure(figsize=(6, 4))
        sns.countplot(data=df_transaction, y='Claimed Vehicle Class')
        st.pyplot(plt.gcf())
