
library("readxl")
library("dplyr")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")
head(ecobici)

str(ecobici)

ecobici %>% 
  select(Colonia,nearbyStations6) %>%
  na.omit(nearbyStations6)
