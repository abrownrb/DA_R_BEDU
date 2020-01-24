
# Podemos trabajar sobre bases de datos ya disponibles en R o importar bases propias 
# Para poder importar un documento (.xlsx, csv, etc.) indicaremos el directorio del fichero, el siguiente es el mio:
setwd("~/Desktop/Bedu - Introducción R/A2-Programacion-con-R/Sesion-02/Teoría")


# Ejecutamos el comando para abrir un documento Excel ya guardado en esta ruta 
data <- read.csv("data.csv", header=TRUE) # Header indica que el documento tiene/no tiene nombres de columnas


datos <- iris
datos <- read.csv('C:/Users/abrow/Desktop/BEDU/iris.csv') # lectura del archivo
str(iris) # Dimensiones, variables, sus clases y ejemplo
sum(is.na(datos)) # Revisar que los datos estén completos
head(datos) # Primeras cinco líneas de la base
