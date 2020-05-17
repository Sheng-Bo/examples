# ===== Load from Excel XLSX =====
library(readxl)
survey_data_001_xlsx <- read_excel("GitHub/tutorial_examples/R for Statistics/survey_data_001.xlsx", 
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
    "numeric"
  )
)

# ===== Load from CSV =====
library(readr)
survey_data_001_csv <- read_csv("GitHub/tutorial_examples/R for Statistics/survey_data_001.csv", 
  col_types = cols(
    Q1 = col_integer(), 
    Q2 = col_integer(), 
    Q3 = col_integer(), 
    Q4 = col_integer(), 
    Q5 = col_integer(), 
    Q6 = col_integer(), 
    Q7 = col_integer(), 
    Q8 = col_integer(), 
    Q9 = col_integer(),
    Q10 = col_integer() 
  )
)

# ===== Load from SPSS =====
library(haven)
survey_data_001_spss1 <- read_sav("GitHub/tutorial_examples/R for Statistics/survey_data_001.sav")

library(foreign)
survey_data_001_spss2 <- read.spss("GitHub/tutorial_examples/R for Statistics/survey_data_001.sav", to.data.frame=TRUE)


# ===== Save to RDS =====
saveRDS(survey_data_001_xlsx, file = "GitHub/tutorial_examples/R for Statistics/survey_data_001.rds")

# ===== Load from RDS =====
survey_data_001_rds <- readRDS(file = "GitHub/tutorial_examples/R for Statistics/survey_data_001.rds")


# ===== Save to CSV =====
write.table(survey_data_001_xlsx,'GitHub/tutorial_examples/R for Statistics/survey_data_001_saved.csv', 
            sep="\t", row.names=FALSE, quote=FALSE)

# ===== Load from CSV Again =====
survey_data_001_csv <- read_csv("GitHub/tutorial_examples/R for Statistics/survey_data_001_saved.csv", 
  col_types = cols(
    Q1 = col_integer(), 
    Q2 = col_integer(), 
    Q3 = col_integer(), 
    Q4 = col_integer(), 
    Q5 = col_integer(), 
    Q6 = col_integer(), 
    Q7 = col_integer(), 
    Q8 = col_integer(), 
    Q9 = col_integer(),
    Q10 = col_integer() 
  )
)


?write.csv
?write.table







  