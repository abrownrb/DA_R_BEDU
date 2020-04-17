#Graficos de base.
tiempo <- c(1:10)
respuesta <- c(1:4, seq(10, 20, 2))  

plot(tiempo,respuesta,
     type='b',
     pch=19,
     col="black",
     main = "Respuesta vs tiempo",
     ylab = "Respuesta",
     xlab = "Tiempo")


#Ejemplo de histograma con dataset de Spotify.
setwd("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-03")
spotify <- read.csv("Reto-01/spotify.csv", header=TRUE)
head(spotify) #Conocer como está estructurado el dataset
str(spotify)  #Conocer a detalle los datos de cada columna  
nrow(spotify) #Conocer el número de observaciones.
ncol(spotify) #Conocer el número de columnas.
mean(spotify$duration_ms) #Conocer la media de duración de las canciones en ms.
median(spotify$acousticness)#Conocer la mediana de acústica.

duracion <- ((spotify$duration_ms/1000)/60) #convertir el tiempo en ms a minutos.

#Graficar el historial de casos para conocer en qué rango de minutos existen más registros.
set.seed(123)
ejemplo <- rnorm(n = 10000, mean = 0, sd = 1)
hist(duracion, col='orange', breaks=40, 
     ylab = "Frecuencia", main = "Histograma ejemplo")
