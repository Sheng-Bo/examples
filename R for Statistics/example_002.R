# ===== Load from Excel XLSX =====
library(readxl)
survey_data_002_xlsx <- read_excel("~/GitHub/tutorial_examples/R for Statistics/survey_data_002.xlsx", 
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

# ===== Summary =====
summary(survey_data_002_xlsx$Q1)
summary(survey_data_002_xlsx$Q2)
summary(survey_data_002_xlsx$Q3)
summary(survey_data_002_xlsx$Q4)
summary(survey_data_002_xlsx$Q5)
summary(survey_data_002_xlsx$Q6)
summary(survey_data_002_xlsx$Q7)
summary(survey_data_002_xlsx$Q8)
summary(survey_data_002_xlsx$Q9)
summary(survey_data_002_xlsx$Q10)

# ===== Histogram of Variables =====
hist(survey_data_002_xlsx$Q1)
hist(survey_data_002_xlsx$Q2)
hist(survey_data_002_xlsx$Q3)
hist(survey_data_002_xlsx$Q4)
hist(survey_data_002_xlsx$Q5)
hist(survey_data_002_xlsx$Q6)
hist(survey_data_002_xlsx$Q7)
hist(survey_data_002_xlsx$Q8)
hist(survey_data_002_xlsx$Q9)
hist(survey_data_002_xlsx$Q10)

barplot(table(survey_data_002_xlsx$Q2))
?barplot
?table

# ===== Show Missing Values =====
is.na(survey_data_002_xlsx)
survey_data_002_xlsx[14, 4]

# ===== Find the number of rows of missing data =====
no_missing <- na.omit(survey_data_002_xlsx)

# ===== Find Outliers =====
oQ1 <- boxplot(no_missing$Q1)
oQ2 <- boxplot(no_missing$Q2)
oQ3 <- boxplot(no_missing$Q3)
oQ4 <- boxplot(no_missing$Q4)
oQ5 <- boxplot(no_missing$Q5)
oQ6 <- boxplot(no_missing$Q6)
oQ7 <- boxplot(no_missing$Q7)
oQ8 <- boxplot(no_missing$Q8)
oQ9 <- boxplot(no_missing$Q9)
oQ10 <- boxplot(no_missing$Q10)

# ===== Show Outliers =====
oQ1$out


# ===== Exclude Cases by Outliers =====
no_missing_outlier <- no_missing
no_missing_outlier <- no_missing_outlier [no_missing_outlier$Q1 != 11,]
no_missing_outlier <- no_missing_outlier [no_missing_outlier$Q1 != 14,]



# ===== Compute Mean for Each Student =====
no_missing_outlier$mean <- 
(
  no_missing_outlier$Q1 +
  no_missing_outlier$Q2 +
  no_missing_outlier$Q3 +
  no_missing_outlier$Q4 +
  no_missing_outlier$Q5 +
  no_missing_outlier$Q6 +
  no_missing_outlier$Q7 +
  no_missing_outlier$Q8 +
  no_missing_outlier$Q9 +
  no_missing_outlier$Q10 
) / 10



# ===== Histogram of Variables =====
hist(no_missing_outlier$Q1)
hist(no_missing_outlier$Q2)
hist(no_missing_outlier$Q3)
hist(no_missing_outlier$Q4)
hist(no_missing_outlier$Q5)
hist(no_missing_outlier$Q6)
hist(no_missing_outlier$Q7)
hist(no_missing_outlier$Q8)
hist(no_missing_outlier$Q9)
hist(no_missing_outlier$Q10)
hist(no_missing_outlier$mean)

# ===== Histogram of Variables (No Gap) =====
barplot(table(no_missing_outlier$Q1))
barplot(table(no_missing_outlier$mean))

# ===== Curve on Histogram =====
par(new=TRUE)   
plot(density(no_missing_outlier$Q1), col=4, yaxt="n", xaxt="n",
     bty='n', xlab="Value", ylab="Frequency", main='Histogram')
  

