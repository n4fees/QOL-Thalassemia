#Load Packages
library(tidyverse)
library(gtsummary)
library(gt)

data <- read.csv("Raw Data/Thalassemia_QOL.csv")
library(dplyr)

#Table 3: Quality of Life Status by Demographics
data |>
  select(1:8, Physical_Health_Status) |>
  tbl_summary(
    by = Physical_Health_Status,
    statistic = list(
      all_continuous() ~ "{mean} ± {sd}",
      all_categorical() ~ "{n} ({p}%)"
    )
  )|>
  add_overall()|>
  as_gt()|>
  gtsave("Tables/Table3.docx")


#Table 4: Quality of Life Status by Clinical Characteritics
tbl <- data |>
  select(9:19, Physical_Health_Status) |>
  tbl_summary(
    by = Physical_Health_Status,
    type = list(all_dichotomous() ~ "categorical"),
    statistic = list(
      all_continuous()  ~ "{mean} ± {sd}",
      all_categorical() ~ "{n} ({p}%)"
    ),
    missing = "ifany"
  ) |>
  add_overall()
tbl |> as_gt()|>
  gtsave("Tables/Table4.docx")

