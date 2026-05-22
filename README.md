**Heart Disease Logistic Regression Analysis**
Overview: This project investigates clinical and demographic factors associated with heart disease using logistic regression and exploratory data analysis in R.

Objectives: Explore relationships between patient characteristics and heart disease status. Assess the impact of age and sex on disease prevalence. Develop a logistic regression model for disease prediction

Workflow: Data cleaning and preprocessing, Duplicate removal, Exploratory data analysis (EDA), Visualization of age and sex distributions, Logistic regression modelling

Tools & Libraries: R, dplyr, ggplot2

Key Findings: Sex differences were observed in heart disease prevalence. Age showed a negative association with heart disease within this dataset, suggesting potential sampling bias or cohort-specific effects
Logistic regression identified several clinically relevant predictors

**Diabetes Risk Factor Analysis**
Overview: This project analyses diabetes-related clinical variables to identify factors associated with diabetes outcomes using statistical analysis and visualization techniques in R.

Objectives: Identify clinical predictors associated with diabetes. Explore relationships between metabolic variables and diabetes status. Apply regression-based analytical methods

Workflow: Data cleaning, Duplicate checks, Missing value assessment, Exploratory data analysis, Logistic regression modelling, Data visualization

Tools & Libraries: R, tidyverse, ggplot2

Key Findings: Age, BMI, and glucose levels demonstrated positive associations with diabetes outcomes. Exploratory analysis highlighted patterns between metabolic indicators and disease status
Logistic regression supported the importance of glucose-related variables in diabetes prediction

**Mendelian Randomization Analysis**

Mendelian Randomization Analysis of LDL Cholesterol and Febrile Seizure Risk

Overview: This project investigates the potential causal relationship between genetically predicted LDL cholesterol levels and febrile seizure risk using a two-sample Mendelian Randomization (MR) framework.

Objectives: Use genetic variants as instrumental variables. Assess whether LDL cholesterol may causally influence febrile seizure risk. Perform sensitivity analyses to evaluate pleiotropy and heterogeneity

Data Sources: Exposure Dataset, LDL cholesterol GWAS summary statistics

Source: GWAS Catalog
Study: Andaleon et al.
Trait: LDL cholesterol

Outcome Dataset: Febrile seizure GWAS summary statistics, Publicly available summary statistics dataset

Methods Used: SNP instrument selection, Instrument filtering using p-value threshold, Harmonization of exposure and outcome datasets

Mendelian Randomization analyses: Inverse Variance Weighted (IVW), MR Egger, Weighted Median, Mode-based methods, Sensitivity Analyses, Heterogeneity testing, Horizontal pleiotropy assessment
Leave-one-out analysis, Funnel plots, Scatter plots, Forest plots

Tools & Libraries: R, TwoSampleMR, ieugwasr, dplyr, data.table, ggplot2

Key Findings: Weak but statistically significant association observed using IVW analysis, Evidence of heterogeneity across SNP instruments, Evidence of directional horizontal pleiotropy
Results should be interpreted cautiously due to potential violation of MR assumptions

Important Note: Raw GWAS summary statistics are not redistributed in this repository due to dataset licensing and size constraints. Users should obtain datasets directly from the original public sources.
