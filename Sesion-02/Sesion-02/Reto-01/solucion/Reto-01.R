#Estructura
str(spotify)

#Cambio de duración a minutos
spotify <- transform(spotify, duration_ms = duration_ms / 1000 / 60)

#
str(spotify)