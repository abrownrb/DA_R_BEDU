#Sexo: ¿Cuántos hombres y mujeres a bordo?
sex <- df %>% 
  group_by(df$Sex) %>% 
  count()

table(df$Sex)

print(sex)

#Edad: ¿Cuál era el promedio de edades de los pasajeros?

mean(df$Age, na.rm = TRUE)

df %>% 
  group_by(Sex) %>% 
  summarise(prom=mean(Age, na.rm = TRUE))
