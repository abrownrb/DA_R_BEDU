
library("readxl")
library("dplyr")
library("ggplot2")
ecobici <- read_xls("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/ecobici.xls")
head(ecobici)


ecobici2 <- subset(ecobici, nearbyStations4 > 0)

ecobici22 <- ecobici %>%
  filter(nearbyStations4 > 0)

ggplot(ecobici2, aes(Colonia)) +
  geom_density(aes(fill=Colonia), alpha=0.1)


