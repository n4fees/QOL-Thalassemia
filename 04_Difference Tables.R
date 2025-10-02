library(tidyverse)
library(gtsummary)
library(gt)

data <- read.csv("Raw Data/Thalassemia_QOL.csv")
library(dplyr)

#Quality of Life Domain Score Differences by Gender
data |>
  select(19:28, Gender)|>
  tbl_summary(
    by = Gender,
    type = everything() ~ "continuous",
    statistic = all_continuous() ~ "{mean} ± {sd}"
  ) |>
  add_p()|>
  bold_p(t = 0.05)|>
  as_gt()|>
  gtsave("Tables/Table5.docx")
