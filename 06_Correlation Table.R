library(tidyverse)
library(gtsummary)
install.packages("easystats")
library(gt)

data <- read.csv("Raw Data/Thalassemia_QOL.csv")
library(dplyr)
library(easystats)

numberic_data <- data|>
  select(19:28)

results <- correlation(numberic_data)
results |>
  summary(redundant = TRUE)|>
  plot()
