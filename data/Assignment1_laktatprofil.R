library(gt)
library(tidyverse)
library(knitr)
library(kableExtra)

view(lac_data)



library(readxl)
lac_data <- read_excel("data/lac_data.xlsx", na = "NA") %>%
  print()

lac_data %>%
  filter(time == "pre") %>%
  select(FP, sex, age, weight, height) %>%
  group_by(sex) %>%
  summarise(MeanAge = mean(age),
            sdAge = sprintf("(%.2f)", sd(age)),
            MeanHeight = mean(height),
            sdHeight = sprintf("(%.2f)", sd(height)),
            MeanWeight = mean(weight),
            sdWeight = sprintf("(%.2f)", sd(weight)), n = n()) %>%
  gt(caption = "Subjects") %>%
  cols_label(MeanAge = "Age",
             sdAge = "",
             MeanHeight = "Height",
             sdHeight = "",
             MeanWeight = "Weight",
             sdWeight = "",
             n = "Participants",
             sex = "Sex") %>%
  print()
