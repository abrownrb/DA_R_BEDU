
library("dplyr")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")

ecobici <- ecobici %>% 
  count(Colonia) %>% 
  arrange(Colonia)

head(ecobici)
