# ===== Load from Excel XLSX =====
library(readxl)
survey_data_003_xlsx <- read_excel("~/GitHub/tutorial_examples/R for Statistics/survey_data_003.xlsx", 
   col_types = c(
     "text", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric", 
     "numeric"
   )
)


# ===== Exclude Cases by Outliers =====
survey_data_003_xlsx <- survey_data_003_xlsx [survey_data_003_xlsx$Q1 != 11,]
survey_data_003_xlsx <- survey_data_003_xlsx [survey_data_003_xlsx$Q1 != 14,]


# ===== Exclude Cases by Missing Data =====
survey_data_003_xlsx <- na.omit(survey_data_003_xlsx)


# ===== DPLYR =====
# https://dplyr.tidyverse.org/
# Pipe operator hot key => Ctrl + Shift + M

library(dplyr)

survey_data_003_xlsx <- survey_data_003_xlsx %>% 
  # filter(Gender == "2") %>% 
  # select(Age, Gender) %>% 
  mutate(Mean = (Q1 + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q10) / 10) %>% 
  arrange(Gender, Age) %>% 
  group_by(Age) %>% 
  mutate (GroupID = group_indices()) 

# survey_data_003_xlsx$GroupID <- group_indices(survey_data_003_xlsx)

  
sum_table1 <- survey_data_003_xlsx %>% 
  ungroup() %>% 
  summarise(Q1Mean = mean(Q1), Q2Mean = mean(Q2), n = n())


sum_table2 <- survey_data_003_xlsx %>%
  ungroup() %>% 
  summarise(
    Q1Mean   = mean(Q1),
    Q1Median = median(Q1),
    Q1Total  = sum(Q1),
    Q1N      = n()
  )

# ===== Find Mode =====
library(modeest)
survey_data_003_xlsx$Q1Mode <- mlv(survey_data_003_xlsx$Q1, method = "mfv")


# Testing of Assumptions (CORR)
# Data Viz
# T-Test 