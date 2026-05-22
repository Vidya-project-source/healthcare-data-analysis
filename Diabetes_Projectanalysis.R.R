install.packages("tidyverse")
#load diabetes dataset 
setwd("C:/Users/Levono/Desktop/Data Analysis Project")
diabetes_dataset <- read.csv("C:/Users/Levono/Desktop/Data Analysis Project/diabetes.csv")
#view first rows
head(diabetes_dataset)

#structure of data

str(diabetes_dataset)

#Summary statistics 
summary(diabetes_dataset)

install.packages("dplyr")
library(dplyr)
#Check for duplicates 
sum(duplicated(diabetes_dataset))

# Check missing values
colSums(is.na(diabetes_dataset))


install.packages("ggplot2")
library(ggplot2)

# Histogram
ggplot(diabetes_dataset, aes(x = BMI)) +
  geom_histogram(bins = 30)

# Save plot
ggsave("bmi_plot.png")
s
# Logistic regression model
model <- glm(Outcome ~ Age + BMI + Glucose,
             data = diabetes_dataset,
             family = "binomial")
summary(model)
