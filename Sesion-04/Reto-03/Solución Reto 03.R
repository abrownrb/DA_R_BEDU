
library("readxl")
library("dplyr")
ecobici <- read_excel("ecobici.xls")
head(ecobici)

unique(ecobici$Tipo)
