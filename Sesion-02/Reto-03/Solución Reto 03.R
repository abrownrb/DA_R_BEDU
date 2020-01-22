
library("dplyr")
ecobici <- read_excel("ecobici.xls")

ecobici <- ecobici %>% 
  count(Colonia) %>% 
  arrange(Colonia)

head(ecobici)
