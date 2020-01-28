
library("readxl")
ecobici <- as.data.frame(read_excel("ecobici.xls"))
head(ecobici)

unique(ecobici[ecobici$Colonia == 'Roma Norte',]$'Codigo Postal')


