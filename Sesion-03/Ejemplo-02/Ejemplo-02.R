
head(mtcars)

library(dplyr) 

mtcars <- mtcars 

select(mtcars, 'nombre carro', mpg, hp)

filter(mtcars, grepl("a", 'nombre carro') & hp > 200 )
 

¿Cuántas estaciones hay por c/ colonia?
  
# opción 1: usar group_by() y n() 
  # Tomar las observaciones y "separarlas por colonia" 
  # Contar cuántas hay en cada grupo
# opción 2: usar count()
  # Contar cuántas cumplen con ser de la misma colonia
# Ambas usar %>%

  
