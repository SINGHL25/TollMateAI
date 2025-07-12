# TollMateAI - Streamlit App for Tolling Data Analysis
# ---------------------------------------------------

# 🔧 FILE: app.py

import streamlit as st
import pandas as pd
from src.data_loader import load_passage_data, load_transaction_data
from src.detectors import detect_lpn_mismatch, detect_missing_tags, calculate_revenue_loss
from src.predictors import predict_traffic_density
from src.visualizer import plot_kpis, plot_visuals

st.set_page_config(page_title="TollMateAI Dashboard", layout="wide")
st.title("🚧 TollMateAI - Tolling Data Analyzer")

# Upload files
passage_file = st.file_uploader("Upload Passage Data (.xlsx)", type=["xlsx"])
transaction_file = st.file_uploader("Upload Transaction Data (.xlsx)", type=["xlsx"])

if passage_file and transaction_file:
    st.success("✅ Files uploaded successfully!")

    # Load data
    df_passage = load_passage_data(passage_file)
    df_transaction = load_transaction_data(transaction_file)

    # Perform analyses
    lpn_mismatches = detect_lpn_mismatch(df_passage)
    missing_tags = detect_missing_tags(df_transaction)
    revenue_loss = calculate_revenue_loss(df_transaction)
    traffic_df = predict_traffic_density(df_transaction)

    # Display KPIs
    plot_kpis(df_transaction, missing_tags, lpn_mismatches, revenue_loss)

    # Visuals
    plot_visuals(df_transaction, traffic_df)

    # Show mismatches and tag issues
    with st.expander("🔍 View LPN Mismatches"):
        st.dataframe(lpn_mismatches)
    with st.expander("🚫 View Missing Tags"):
        st.dataframe(missing_tags)
    with st.expander("💸 Revenue Loss Details"):
        st.dataframe(revenue_loss)
else:
    st.info("👆 Please upload both Passage and Transaction Excel files to proceed.")


