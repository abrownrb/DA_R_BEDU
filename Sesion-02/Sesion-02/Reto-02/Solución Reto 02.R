
library("readxl")
library("dplyr")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")
head(ecobici)
colnames(ecobici)
ecobici <- select(ecobici, Direccion, 'Codigo Postal', Colonia, nearbyStations,nearbyStations2,
                  nearbyStations3,nearbyStations4,nearbyStations5,nearbyStations6,punto_geo,latitud,longitud)
head(ecobici)
