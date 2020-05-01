
library("readxl")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")
head(ecobici)


ecobici2 <- subset(ecobici, nearbyStations4 > 0)
vis <- ggplot(ecobici2, aes(Colonia))
vis + geom_density(aes(fill=factor(Colonia)), alpha=0.8)


