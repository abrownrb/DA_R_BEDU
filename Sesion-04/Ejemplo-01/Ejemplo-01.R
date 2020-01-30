# Librerías necesarias
require(tidyverse) # Exploración de datos
require(dplyr) # Manejo de bases de datos
require(ggplot2) # Visualización de datos
require(GGally) # Gráfica de correlación
require(DataExplorer) # Reportes EDA
library(data.table)
library(readxl)

# Leer el fichero titanic.csv como un dataframe
setwd("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-04/Teoría/")
csv <- read.csv("titanic.csv", header=TRUE)
df <- as.data.frame(csv)

names(df)

head(df)
nrow(df)
ncol(df)

str(df)
# Transformamos en factor
df$Survived <- factor(titanic_train$Survived)

summary(df)

# Completar los missing values del atributo Age con la mediana del resto de datos de esa variable pero 
# agrupado de acuerdo a las variables Pclass y Title 
sum(is.na(df$Age)) ## 177 NAs 
df$Age[is.na(df$Age)] <- median(df$Age, na.rm = TRUE)
head(df)

# Despues de realizar las operaciones anteriores, eliminar ahora cualquier fila que tenga al menos un NA.
df <- na.omit(df)
sum(is.na(df))

#Supervivencia: ¿Cuál fue el número de sobrevivientes?
sobrev <- titanic_train %>%
        group_by(Survived) %>%
        count()

print(sobrev)

# Calcular el porcentaje de pasajeros que sobrevivio
perc <- sum(df$Survived)/length(df$Survived)*100
perc

# Calcular la probabilidad de supervivencia en base al genero (sex).
surperc <- prop.table(table(df$Sex, df$Survived), 1)
surperc