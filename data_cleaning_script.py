import pandas as pd
import numpy as np

# -----------------------------
# 1. Load data
# -----------------------------
df = pd.read_csv("data/supply_chain_data.csv")

print("Initial shape:", df.shape)

# -----------------------------
# 2. Standardize column names
# -----------------------------
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace(" ", "_")
)

# -----------------------------
# 3. Remove duplicate rows
# -----------------------------
df.drop_duplicates(inplace=True)

# -----------------------------
# 4. Handle duplicate lead time columns
# -----------------------------
# lead_times + lead_time -> final_lead_time
if "lead_times" in df.columns and "lead_time" in df.columns:
    df["final_lead_time"] = df[["lead_times", "lead_time"]].mean(axis=1)
    df.drop(columns=["lead_times", "lead_time"], inplace=True)

# -----------------------------
# 5. Convert numeric columns safely
# -----------------------------
numeric_cols = [
    "price",
    "number_of_products_sold",
    "revenue_generated",
    "stock_levels",
    "order_quantities",
    "shipping_times",
    "shipping_costs",
    "production_volumes",
    "manufacturing_lead_time",
    "manufacturing_costs",
    "defect_rates",
    "costs"
]

for col in numeric_cols:
    if col in df.columns:
        df[col] = pd.to_numeric(df[col], errors="coerce")

# -----------------------------
# 6. Handle missing values
# -----------------------------
# Numeric columns → median
for col in numeric_cols:
    if col in df.columns:
        df[col].fillna(df[col].median(), inplace=True)

# Categorical columns → mode
categorical_cols = df.select_dtypes(include="object").columns

for col in categorical_cols:
    df[col].fillna(df[col].mode()[0], inplace=True)

# -----------------------------
# 7. Create derived business columns
# -----------------------------

# Profit (basic business logic)
if "revenue_generated" in df.columns and "costs" in df.columns:
    df["profit"] = df["revenue_generated"] - df["costs"]

# Shipping risk flag
if "shipping_times" in df.columns:
    df["shipping_risk_flag"] = np.where(
        df["shipping_times"] > df["shipping_times"].median(),
        "High Risk",
        "Low Risk"
    )

# Stock risk flag
if "stock_levels" in df.columns:
    df["stock_risk_flag"] = np.where(
        df["stock_levels"] < df["stock_levels"].quantile(0.25),
        "Low Stock",
        "Normal"
    )

# -----------------------------
# 8. Final sanity checks
# -----------------------------
df = df[df["price"] >= 0]
df = df[df["revenue_generated"] >= 0]

print("Final shape:", df.shape)

# -----------------------------
# 9. Save cleaned data
# -----------------------------
df.to_csv("data/cleaned_supply_chain_data.csv", index=False)

print("Data cleaning completed. File saved as cleaned_supply_chain_data.csv")
