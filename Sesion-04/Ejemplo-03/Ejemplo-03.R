install.packages('titanic')

library(dplyr)
library(titanic)
names(titanic_train)

str(titanic_train)
head(titanic_train)
nrow(titanic_train)
ncol(titanic_train)

# Transformamos en factor
titanic_train$Survived <- factor(titanic_train$Survived)
# Transforamamos al castellano

#Supervivencia: ¿Cuál fue el número de sobrevivientes?
sobrev <- titanic_train %>%
  group_by(Survived) %>%
  count()

print(sobrev)


#  Clase: ¿Cuál fue la cantidad de pasajeros en cada clase?

clases <- titanic_train %>%
  group_by(titanic_train$Pclass) %>%
  count()

print(clases)



#Sexo: ¿Cuántos hombres y mujeres a bordo?
sex <- titanic_train %>% 
  group_by(titanic_train$Sex) %>% 
  count()

print(sex)

#Edad: ¿Cuál era el promedio de edades de los pasajeros?


mean(titanic_train$Age, na.rm = TRUE) #el segundo argumento en funcion mean elimina valores nulos del dataframe.





