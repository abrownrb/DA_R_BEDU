`Data Science` > [`Programacion con R`]
## Exploracion de datos

### OBJETIVO
- Comprobar la estructura de la tabla
- Ver correlaciones entre variables

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion04/Reto-02`

#### DESARROLLO
Usaremos las variables que crearmos en el reto 1 de la Sesion 3: 
```{r}
ecobici$estacion1 <- ifelse(ecobici$nearbyStations>=1, 1, 0)
ecobici$estacion2 <- ifelse(ecobici$nearbyStations2>=1, 1, 0)
ecobici$estacion3 <- ifelse(ecobici$nearbyStations3>=1, 1, 0)
ecobici$estacion4 <- ifelse(ecobici$nearbyStations4>=1, 1, 0)
ecobici$estacion5 <- ifelse(ecobici$nearbyStations5>=1, 1, 0)
ecobici$estacion6 <- ifelse(ecobici$nearbyStations6>=1, 1, 0)
```

A continuacion, crearemos una tabla apoyandonos del package dplyr seleccionando las Colonias y las nuevas seis variables, agruparemos la informacion por colonia, y veremos cuantas estaciones tiene cerca cada una de las colonias (hint: summarize(sum())). Finalmente, ordenaremos la informacion alfabeticamente por colonia. 