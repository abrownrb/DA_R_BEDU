spotify <- read.csv('/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-03/Reto-01/spotify.csv')
#Estructura
str(spotify)

#Cambio de duración a minutos
spotify <- transform(spotify, duration_ms = duration_ms / 1000 / 60)

#
str(spotify)

spotify$duration_ms

spotify$duration_ms <- transform(spotify$duration_ms / 1000 / 60)