`Data Science` > [`Programacion con R`]
## Dplyr

### OBJETIVO
- Aprenderas a cargar un package
- Aprenderas a usar dplyr
- Aprenderas a seleccionar y filtrar informacion 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion02/Ejemplo-02`

#### DESARROLLO


Cargamos el paquete que nos permitira hacer el ejercicio   
```{r}
library(dplyr)
```

Vamos a usar la informacion de mtcars, ya disponible en R 
```{r}
head(mtcars)
```

Creamos la variable mtcars para poder hacer operaciones sobre esos datos 
```{r}
mtcars <- mtcars 
```

Selecciona las variables nombre del carro, millas por galon y horse power 
```{r}
select(mtcars, 'nombre carro', mpg, hp) 
```
Usamos las comillas para que detecte que es una palabra compuesta 


Filtra por aquellos vehiculos que tengan hp mayor a 200 y su nombre contenga la letra "a" 
```{r}
filter(mtcars, grepl("a", 'nombre carro') & hp > 200 )
```
