`Data Science` > [`Programacion con R`]
## Dplyr en un solo comando

### OBJETIVO
- Aprenderas a usar dplyr
- Aprenderas a crear una orden compleja en un solo comando de codigo

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion02/Ejemplo-03`

#### DESARROLLO
Con la ayuda del package dplyr, haremos los siguientes comandos con una sola orden (Hint: usar "%>%")
```{r}
library(dplyr)
```

Usa la base de datos precargada llamada iris y calcula la media de la sepal.length y la sepal.width segun la especie.
Finalmente, ordena los resultas alfabeticamente segun la especie. 
```{r}
head(iris)
library
iris <- iris # Guardo la tabla en la memoria de objetos
iris %>% # Datos que usare
  group_by(Species) %>% # Variable de agrupacion
  summarise(Media_Sepal_Length = mean(Sepal.Length), # Media de sepal length
            Media_Sepal_Width = mean(Sepal.Width)) %>% # Media de sepal width
  arrange(Species) # Ordenar por especies (por defecto es orden ascendiente)
```
