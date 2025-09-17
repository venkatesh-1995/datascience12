import pandas as pd
import streamlit as st

@st.cache_data
def load_data(file_path="Source Sales Data.xls"):
    df = pd.read_excel(file_path)
    df['Order Date'] = pd.to_datetime(df['Order Date'])
    df['Ship Date'] = pd.to_datetime(df['Ship Date'])
    return df
