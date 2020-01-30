#Sexo: ¿Cuántos hombres y mujeres a bordo?
sex <- titanic_train %>% 
  group_by(titanic_train$Sex) %>% 
  count()

print(sex)

#Edad: ¿Cuál era el promedio de edades de los pasajeros?

mean(titanic_train$Age, na.rm = TRUE)

titanic_train %>% 
  group_by(Sex) %>% 
  summarise(prom = mean(Age, na.rm = TRUE))
