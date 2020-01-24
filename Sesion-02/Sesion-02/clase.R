getwd() #dónde estás
dir() # qué hay dentro de la carpeta
setwd('~/Desktop/BEDU/A2-Programacion-con-R/Sesion-02/Teoría')
# cambias de directorio
dir.create('Nueva carpeta') # crear carpeta
personas <- read.csv('characters.csv', 
                     stringsAsFactors = FALSE)
# leer archivos csv _____ read_csv

personas2 <- readr::read_csv('characters.csv')
# encoding español 'UTF-8'

str(personas) # estructura de la base
head(personas) # primeras filas 
tail(personas) # últimas filas
summary(personas) # resumen descriptivo de la base
# mini

?readr # pedir ayuda

install.packages('dplyr')
library(dplyr)

#  by = c('primer tabla'='segunda tabla') 
# cuando no coinciden en el nombre

na.omit() # borra cualquier fila que tenga NA

a <- dplyr::select(personas, name)
b <- dplyr::filter(personas, nchar(personas$name)<10)

c <- dplyr::select(personas, name) %>%
  dplyr::filter(nchar(personas$name)<10) 

# select - elegir qué variables tomar de la base
# filter - con qué criterios depurar la base
# arrange - ordenar descendente o ascendente - mixed 
# mutate - cambiar, sobreescribir o crear una variable
# summarise - resumir o simplificar variables
# group_by - unir con valores iguales

nom1 - 10
nom2- 1
nom1 - 3

nom1 - 13
nom2  1
colnames(personas)
unique(personas$name)

group_by(nombre) %>% summarise(compra = sum(compra))

a <- dplyr::select(personas, name) %>%
  mutate(name = toupper(name),
         nombre = tolower(name))

iris %>%
  group_by(Species) %>%
  summarise(n()) 

iris %>%
  group_by(Species) %>%
  unique() 

dplyr::mutate




