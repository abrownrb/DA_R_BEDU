
# Podemos trabajar sobre bases de datos ya disponibles en R o importar bases propias 
# Para poder importar un documento (.xlsx, csv, etc.) indicaremos el directorio del fichero, el siguiente es el mio:
setwd("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-02/Teoría")

# Ejecutamos el comando para abrir un documento Excel ya guardado en esta ruta 
data <- read.csv("data.csv", header=TRUE, encoding = 'UTF-8') # Header indica que el documento tiene/no tiene nombres de columnas

# csv, xlsx, sas, stata, spss, txt, espaciales y no estructurados