getwd()
setwd("C:/Users/Levono/Desktop/Data Analysis Project/Heart disease")
library(dplyr)
library(ggplot2)
#Load heartdisease dataset 
heart_data <- read.csv("heart.csv")
#Data structure and cleaning 
head(heart_data)
tail(heart_data) 
str(heart_data) 
summary(heart_data) 
sum(duplicated(heart_data))

#Remove duplicates 
clean_heart_data <-unique(heart_data) 
sum(duplicated(clean_heart_data)) 
names(clean_heart_data) 
table(clean_heart_data$target)

# Heart disease proportion based on gender 
table(clean_heart_data$sex) 
aggregate(target ~ sex, data = clean_heart_data, mean)

#Visualise distribution by sex 

histogram <- ggplot(clean_heart_data,
                    aes(x = age, fill = factor(sex))) +
  geom_histogram(bins = 20,
                 alpha = 0.6,
                 position = "identity")

histogram

ggsave("age_sex_hist.png", plot = histogram)

density_plot <- ggplot(clean_heart_data,
                       aes(x = age, color = factor(sex))) +
  geom_density()

density_plot

ggsave("age_density.png", plot = density_plot)

#check counts based on age 
table(clean_heart_data$sex, cut(clean_heart_data$age, breaks = c(20,30,40,50,60,70,80)))

#logistic model 
model1 <- glm(target ~ age + sex, family = binomial(link = "logit"), data = clean_heart_data) 
summary(model1)

model2 <- glm(target ~ age + sex + chol, family = binomial, data = clean_heart_data)

summary(model2)

# Age distribution by outcome
tapply(clean_heart_data$age, clean_heart_data$target, mean)
boxplot(age ~ target, data = clean_heart_data)
tapply(clean_heart_data$age, list(clean_heart_data$target, clean_heart_data$sex), mean)
# Age distribution by outcome suggests non-intuitive pattern
# may indicate sampling bias or cohort structure

