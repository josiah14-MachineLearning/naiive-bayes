import hy.macros
import numpy as np
import pandas as pd
import matplotlib as mpl
import matplotlib.pyplot as plt
from helpers import *

hy.macros.require("helpers", None, assignments="ALL", prefix="")
mpl.use("TkAgg")
pima_df = pd.read_csv(
    "http://nrvis.com/data/mldata/pima-indians-diabetes.csv",
    header=None,
    names=[
        "Pregnancies",
        "Glucose",
        "DiastolicBloodPressure",
        "SkinThickness",
        "Insulin",
        "BMI",
        "DiabetesPedigreeFunction",
        "Age",
        "Cassification",
    ],
)
print("Here is what the raw data looks like...")
print(pima_df)
print()
total_number_of_records = len(pima_df.index)


def describe_column(df, column_name):
    """"""
    """
  Run the `describe` function on a column of the provided dataframe.
  """
    """"""
    return df.get(column_name).describe()


print("Here's some metrics on the raw Pregnancies values")
print(describe_column(pima_df, "Pregnancies"))
print()
print("Here's some metrics on the raw Glucose values")
print(describe_column(pima_df, "Glucose"))
print()
print("Here's some metrics on the raw Diastolic Blood Pressure values")
print(describe_column(pima_df, "DiastolicBloodPressure"))
print()
print("Here's some metrics on the raw Skin Thickness values")
print(describe_column(pima_df, "SkinThickness"))
print()
print("Here's some metrics on the raw Insulin values")
print(describe_column(pima_df, "Insulin"))
print()
print("Here's some metrics on the raw BMI values")
print(describe_column(pima_df, "BMI"))
print()
print("Here's some metrics on the raw Diabetes Pedigree Function")
print(describe_column(pima_df, "DiabetesPedigreeFunction"))
print()
print("Here's some metrics on the raw Age")
print(describe_column(pima_df, "Age"))


def filter_low_values(df, column_name, lower_limit):
    return df.loc[
        df.get(column_name) < lower_limit,
    ]


pima_no_glucose_df = filter_low_values(pima_df, "Glucose", 30.0).sort_values(
    by="Glucose", ascending=False
)
print(pima_no_glucose_df)
print("Percentage of Glucose values that were 0")
print(len(pima_no_glucose_df.index) / (total_number_of_records / 100))
pima_no_bp_df = filter_low_values(
    pima_df, "DiastolicBloodPressure", 10.0
).sort_values(by="DiastolicBloodPressure", ascending=False)
print(pima_no_bp_df)
print("Percentage of DiastolicBloodPressure values that were 0")
print(len(pima_no_bp_df.index) / (total_number_of_records / 100))
pima_no_skin_thickness_df = filter_low_values(
    pima_df, "SkinThickness", 5.0
).sort_values(by="SkinThickness", ascending=False)
print(pima_no_skin_thickness_df)
print("Percentage of SkinThickness values that were 0")
print(len(pima_no_skin_thickness_df.index) / (total_number_of_records / 100))
pima_no_insulin_df = filter_low_values(pima_df, "Insulin", 10.0).sort_values(
    by="Insulin", ascending=False
)
print(pima_no_insulin_df)
print("Percentage of Insulin values that were 0")
print(len(pima_no_insulin_df.index) / (total_number_of_records / 100))
pima_no_bmi_df = filter_low_values(pima_df, "BMI", 5.0).sort_values(
    by="BMI", ascending=False
)
print(pima_no_bmi_df)
print("Percentage of BMI values that were 0")
print(len(pima_no_bmi_df.index) / (total_number_of_records / 100))
pima_no_diabetes_pedigree_function_df = filter_low_values(
    pima_df, "DiabetesPedigreeFunction", 0.05
).sort_values(by="DiabetesPedigreeFunction", ascending=False)
print(pima_no_diabetes_pedigree_function_df)
print("Percentage of DiabetesPedigreeFunction values that were 0")
print(
    len(pima_no_diabetes_pedigree_function_df.index)
    / (total_number_of_records / 100)
)
print()
print("Column statistics which account for null/invalid values")
print()
print(
    "Pregnancies Column statistics - raw form used because 0s are "
    + "significant: "
)
print(describe_column(pima_df, "Pregnancies"))
print(
    "Median Pregnancies: "
    + str(pima_df.loc[slice(None, None), "Pregnancies"].median())
)
rows_with_glucose_value = (
    (~pima_df.isin(pima_no_glucose_df)).get("Glucose").values
)
pima_glucose_df = pima_df.loc[
    rows_with_glucose_value,
]
print()
print("Glucose Column statistics when nulls excluded: ")
print(describe_column(pima_glucose_df, "Glucose"))
print(
    "Median Glucose: "
    + str(pima_glucose_df.loc[slice(None, None), "Glucose"].median())
)
rows_with_diastolic_bp = (
    (~pima_df.isin(pima_no_bp_df)).get("DiastolicBloodPressure").values
)
pima_bp_df = pima_df.loc[
    rows_with_diastolic_bp,
]
print()
print("DiastolicBloodPressure statistics when nulls excluded: ")
print(describe_column(pima_bp_df, "DiastolicBloodPressure"))
print(
    "Median DiastolicBloodPressure: "
    + str(pima_bp_df.loc[slice(None, None), "DiastolicBloodPressure"].median())
)
rows_with_skin_thinkness = (
    (~pima_df.isin(pima_no_skin_thickness_df)).get("SkinThickness").values
)
pima_skin_thickness_df = pima_df.loc[
    rows_with_skin_thinkness,
]
print()
print("SkinThickness statistics when nulls excluded: ")
print(describe_column(pima_skin_thickness_df, "SkinThickness"))
print(
    "Median SkinThickness: "
    + str(
        pima_skin_thickness_df.loc[slice(None, None), "SkinThickness"].median()
    )
)
rows_with_insulin_value = (
    (~pima_df.isin(pima_no_insulin_df)).get("Insulin").values
)
pima_insulin_df = pima_df.loc[
    rows_with_insulin_value,
]
print()
print("Insulin Column statistics when nulls excluded: ")
print(describe_column(pima_insulin_df, "Insulin"))
print(
    "Median Insulin: "
    + str(pima_insulin_df.loc[slice(None, None), "Insulin"].median())
)
rows_with_bmi = (~pima_df.isin(pima_no_bmi_df)).get("BMI").values
pima_bmi_df = pima_df.loc[
    rows_with_bmi,
]
print()
print("BMI Column statistics when nulls excluded: ")
print(describe_column(pima_bmi_df, "BMI"))
print("Median BMI: " + str(pima_bmi_df.loc[slice(None, None), "BMI"].median()))
print()
print(
    "DiabetesPedigreeFunction Column statistics - raw form used because "
    + "there weren't any null/invalid values."
)
print(describe_column(pima_df, "DiabetesPedigreeFunction"))
print(
    "Median DiabetesPedigreeFunction: "
    + str(pima_df.loc[slice(None, None), "DiabetesPedigreeFunction"].median())
)
print()
print(
    "Age Column statistics - raw form used because "
    + "there weren't any null/invalid values."
)
print(describe_column(pima_df, "Age"))
print("Median Age: " + str(pima_df.loc[slice(None, None), "Age"].median()))
pima_age_class_df = pima_df.groupby(["Age", "Cassification"], as_index=False)[
    "Pregnancies",
].count()
pima_age_class_df.plot.bar()
plt.show()
bins = [0, 6, 12, 18, 24, 30, 36, 42, 48, 54, 60, 66, 72, 78, 84]
labels = [
    "0-6",
    "7-12",
    "13-18",
    "19-24",
    "25-30",
    "31-36",
    "37-42",
    "43-48",
    "49-54",
    "55-60",
    "61-66",
    "67-72",
    "73-78",
    "79-84",
]
pima_df.loc[slice(None, None), "age-binned-half-std"] = pd.cut(
    pima_df.get("Age"), bins, labels=labels
)
pima_age_groupings_df = pima_df.groupby(
    ["age-binned-half-std"], as_index=False
)[
    "Age",
].count()
print(pima_age_groupings_df)
pima_age_groupings_df.plot(kind="bar")
plt.show()
bins = [0, 12, 24, 36, 48, 60, 72, 84]
labels = ["0-12", "13-24", "25-36", "37-48", "49-60", "61-72", "73-84"]
pima_df.loc[slice(None, None), "age-binned-one-std"] = pd.cut(
    pima_df.get("Age"), bins, labels=labels
)

pima_age_groupings_df = pima_df.groupby(["age-binned-one-std"], as_index=False)[
    "Age",
].count()

pima_age_groupings_df.plot(kind="bar")
plt.show()
bins = [0, 12, 18, 24, 30, 42, 54, 66, 84]
labels = ["0-12", "13-18", "19-24", "24-30", "31-42", "43-54", "55-66", "67-84"]
pima_df.loc[slice(None, None), "age-binned-hybrid-std"] = pd.cut(
    pima_df.get("Age"), bins, labels=labels
)
pima_age_groupings_df = pima_df.groupby(
    ["age-binned-hybrid-std"], as_index=False
)[
    "Age",
].count()
pima_age_groupings_df.plot(kind="bar")
plt.show()
