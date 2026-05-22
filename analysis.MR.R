library(tidyr)
library(dplyr)
library(data.table)
library(TwoSampleMR)
library(ieugwasr)

#Load datasets

febrile_data <- read.table(
  "C:/Users/Levono/Desktop/Data Analysis Project/MR/Febrile_Seizures.txt",
  header = TRUE,
  sep = "",
  fill = TRUE
)

 ldl_data <- data.table::fread(
  "C:/Users/Levono/Desktop/Data Analysis Project/MR/Andaleon_29404214_Cebu_LDL_rank.assoc.txt.gz"
)


#Format outcome (febrile)

outcome_dat <- data.frame(
  SNP = febrile_data$rsid,
  beta = febrile_data$BETA,
  se = febrile_data$SE,
  effect_allele = febrile_data$eff_allele,
  other_allele = febrile_data$alt_allele,
  pval = febrile_data$P
)

outcome_dat <- outcome_dat[!is.na(outcome_dat$SNP), ]

#Format exposure (LDL)

exposure_data <- data.frame(
  SNP = ldl_data$rs,
  beta = ldl_data$beta,
  se = ldl_data$se,
  effect_allele = ldl_data$allele1,
  other_allele = ldl_data$allele0,
  pval = ldl_data$p_wald
)

#Select instruments

exposure_iv <- exposure_data %>%
  arrange(pval) %>%
  filter(pval < 1e-4) %>%
  distinct(SNP, .keep_all = TRUE)

#LD clumping

exposure_iv$rsid <- exposure_iv$SNP

clumped <- exposure_iv %>%
  arrange(pval) %>%
  distinct(SNP, .keep_all = TRUE)

str(clumped)

clumped <- clumped %>%
  dplyr::select(-rsid)
  
#Format for MR 

exposure_fmt <- format_data(clumped, type = "exposure")

outcome_fmt <- format_data(outcome_dat, type = "outcome")

#Harmonize datasets

harmonised <- harmonise_data(exposure_fmt, outcome_fmt)

mr_results <- mr(harmonised)
mr_results


#Heterogeneity test
mr_heterogeneity(harmonised)

#Pleiotropy test
mr_pleiotropy_test(harmonised)

#Leave-one-out
mr_leaveoneout(harmonised)

#scatter plot to check SNP-level consistency

mr_scatter_plot(mr_results, harmonised)

# Forest plot to check sensitivity of each SNP

mr_forest_plot(mr_leaveoneout(harmonised))

#Funnel plot (bias check)

mr_funnel_plot(mr_singlesnp(harmonised))

#Leave-one-out plot 

mr_leaveoneout_plot(mr_leaveoneout(harmonised))

#IVW result Weak but statistically significant positive association
#Strong heterogeneity across SNPs
#Evidence of directional horizontal pleiotropy (Some SNPs affect outcome via pathways other than LDL
IVW estimate may be biased upward or downward)
#Leave-one-out (No single SNP is dominating the signal)
