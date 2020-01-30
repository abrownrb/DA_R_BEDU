#Ejemplo de gráficos de base.
tiempo <- c(1:10)
respuesta <- c(1:4, seq(10, 20, 2))  

plot(tiempo,respuesta,
     type='b', # probar con l
     pch=15, # cambiar número
     col="black", 
     main = "Respuesta vs tiempo",
     ylab = "Respuesta",
     xlab = "Tiempo")


#Ejemplo de histograma con dataset de Spotify.

# Estrucutra de datos y contenido
spotify <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-04/Ejemplo-01/spotify.csv", header=TRUE)
head(spotify) #Conocer como está estructurado el dataset
str(spotify)  #Conocer a detalle los datos de cada columna  
nrow(spotify) #Conocer el número de observaciones.
ncol(spotify) #Conocer el número de columnas.

sum(is.na(spotify)) # Revisar que los datos estén completos

# Estadística descriptiva
## Medidas de tendencia central
summary(spotify) # Resumen de variables
mean(spotify$duration_ms) #Conocer la media de duración de las canciones en ms.
median(spotify$acousticness)#Conocer la mediana de acústica.

spotify <- spotify %>%
  mutate(duracion = ((duration_ms/1000)/60)) #convertir el tiempo en ms a minutos.

#Graficar el historial de casos para conocer en qué rango de minutos existen más registros.
hist(spotify$duracion, col='orange', breaks=40, 
     ylab = "Frecuencia", main = "Histograma ejemplo")

