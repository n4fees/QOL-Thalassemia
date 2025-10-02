#Load Packages
library(tidyverse)
install.packages("gtsummary")
library(gtsummary)
library(gt)
install.packages("xlsx")

#Load Data#Load D"xlsx"ata
data <- read.csv("Raw Data/Thalassemia_QOL.csv")
library(dplyr)

#Removing the unnecessary last column
data <- select(data, -last_col())
print(data)

#Table 1: Demographic Characteristics of the patients

data |>
  select(1:8)|>
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean} ± {sd}",
      all_categorical() ~ "{n} / {N} ({p}%)"
    )
  )|>
  as_gt()|>
  gtsave("Tables/Table1.docx")


#Table 2: Clinical Summary of Patients
data|>
  select(9:19)|>
  tbl_summary(
    statistic = list(
      all_continuous() ~ "{mean} ± {sd}",
      
    
  )
  
  data |>
    select(9:19) |>
    tbl_summary(
      type = list(all_dichotomous() ~ "categorical"),
      statistic = list(
        all_continuous()  ~ "{mean} ± {sd}",
        all_categorical() ~ "{n} ({p}%)"
      ),
      missing = "ifany"
    )|>
  as_gt()|>
  gtsave("Tables/Table2.docx")

