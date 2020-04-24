
library("readxl")
library("dplyr")
library("ggplot2")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")
head(ecobici)
# Base Ecobici
# Ggplot
# Filtrar aquellas que tienen más de 4 estaciones cerca
# Graficar densidad de cada colonia:
# Número de estaciones en cada colonia

# tip: filter -nearbyStations4
# geom_density

prueba_eco <- filter(ecobici, nearbyStations4>0)

ggplot(prueba_eco, aes(Colonia)) +
  geom_density()

ggplot(prueba_eco, aes(x = Colonia, y = nearbyStations)) +
  geom_bar(stat = "identity", position="stack")

ecobici2 <- subset(ecobici, nearbyStations4 > 0)
vis <- ggplot(ecobici2, aes(Colonia))
vis + geom_density(aes(fill=factor(Colonia)), alpha=0.2)


