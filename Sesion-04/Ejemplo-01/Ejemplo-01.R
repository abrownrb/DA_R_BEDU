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
csv <- read.csv("titanic.csv", header=TRUE, stringsAsFactors = FALSE)
df <- as.data.frame(csv)

names(df)

head(df)
nrow(df)
ncol(df)

str(df)
# Transformamos en factor
df$Survived <- factor(df$Survived)
 
df <- df %>% 
  mutate(Survived = factor(Survived))

summary(df)

# Completar los missing values del atributo Age con la mediana del resto de datos de esa variable pero 
# agrupado de acuerdo a las variables Pclass y Title 
sum(is.na(df)) 

sum(is.na(df$Age)) ## 177 NAs 
df$Age[is.na(df$Age)] <- median(df$Age, na.rm = TRUE)
# df$Age[c(1,2),] <- 
head(df)

# Despues de realizar las operaciones anteriores, eliminar ahora cualquier fila que tenga al menos un NA.
df <- na.omit(df)
sum(is.na(df))

unique(df$Cabin)

cabin <- df %>% filter(Cabin =='')
cabin_si <- df %>% filter(Cabin !='')
table(cabin$Pclass)
table(cabin_si$Pclass)

head(cabin)
summary(cabin)

#Supervivencia: ¿Cuál fue el número de sobrevivientes?
sobrev <- df %>%
        group_by(Survived) %>%
        count()
print(sobrev)

obj <- table(df$Survived)
df$Survived %>% table() 

sobrev

# Calcular el porcentaje de pasajeros que sobrevivio
df <- df %>%
  mutate(Survived = as.numeric(Survived)) %>%
  mutate(Survived = ifelse(Survived==1, 0, 1))

perc <- sum(df$Survived)/length(df$Survived)*100
perc

# Calcular la probabilidad de supervivencia en base al genero (sex).
surperc <- prop.table(table(df$Sex, df$Survived), 1)
surperc

# ¿Cuántos hombres y mujeres a bordo?
# ¿Cuál era el promedio de edades de los pasajeros?
# ¿Cuál era el promedio de edades de los pasajeros por sexo?
