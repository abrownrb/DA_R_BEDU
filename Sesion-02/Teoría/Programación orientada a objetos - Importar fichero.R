
# Podemos trabajar sobre bases de datos ya disponibles en R o importar bases propias 
# Para poder importar un documento (.xlsx, csv, etc.) indicaremos el directorio del fichero, el siguiente es el mio:
setwd("~/Desktop/Bedu - Introducci??n R/A2-Programacion-con-R/Sesion-02/Teor??a")


# Ejecutamos el comando para abrir un documento Excel ya guardado en esta ruta 
data <- read.csv("data.csv", header=TRUE) # Header indica que el documento tiene/no tiene nombres de columnas

