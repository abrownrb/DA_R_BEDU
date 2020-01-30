mtcars <- mtcars
library(dplyr)
#Imprima la columna hp con la función select(). Intente usar la función pull() en
#lugar de seleccionar para ver cuál es la diferencia.
mtcars %>% select(hp)

#Imprima todos menos la columna hp utilizando la función select().
mtcars %>% select(-hp)

#Imprima las columnas mpg, hp, vs, am, gear. Considere usar los dos puntos : para simplificar
#la selección de columnas consecutivas.
mtcars %>% select(mpg, hp, vs:gear)

#Cree el objeto mycars que contiene las columnas mpg, hp columnas pero deje
#que los nombres de las columnas sean miles_per_gallon y horse_power respectivamente 
#y traiga los nombres de las filas al dataframe usando tibble :: rownames_to_column ().
mycars = mtcars %>% 
  select(miles_per_gallon = mpg, horse_power = hp) %>% 
  tibble::rownames_to_column(var = "model")


#Cree una nueva variable en el dataframe de mycars km_per_litre utilizando 
#la función mutate(). Sugerencia: 1 mpg es 0.425 km / l.

mycars = mycars %>% 
  mutate(
    km_per_litre = 0.425*miles_per_gallon
  )

#Seleccione al azar e imprima la mitad de las observaciones de mycars. 
#Sugerencia: considere usar la función sample_frac ()

mycars %>% sample_frac(size = 0.5, replace = FALSE)

#Cree un objeto mycars_s, que contenga de la 10ª a la 35ª fila de mycars. 
#Sugerencia: considere usar la función slice().

mycars_s = mycars %>% slice(10:35)

#Imprima el objeto mycars_s sin duplicados. Sugerencia: considere usar la función distinct().
mycars_s %>% distinct()

#Imprima desde el objeto mycars_s todas las observaciones que tienen mpg> 20 y hp> 100.
mycars_s %>% filter(miles_per_gallon > 20, 
                    horse_power > 100)

#Imprima la fila correspondiente al automóvil Lotus Europa.
mycars %>% filter(model == "Lotus Europa")