
library("readxl")
library("dplyr")
library("ggplot2")
ecobici <- read_excel("ecobici.xls")
head(ecobici)


ecobici2 <- subset(ecobici, estacion4 > 0)
vis <- ggplot(ecobici2, aes(Colonia))
vis + geom_density(aes(fill=factor(Colonia)), alpha=0.8)


