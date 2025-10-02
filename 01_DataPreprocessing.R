#Load Packages
library(tidyverse)
library(readxl)

#Load Data
data <- read_excel("Raw Data/Thalassemia_QOL.xlsx")

#Check missing values
is.na(data)
sum(is.na(data))

