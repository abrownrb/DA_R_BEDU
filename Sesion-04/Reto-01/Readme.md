`Data Science` > [`Programacion con R`]
## Exploracion de datos

### OBJETIVO
- Comprobar la estructura de la tabla
- Extraer variables en funcion de otras 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion04/Reto-01`

#### DESARROLLO
Vamos a usar la funcion str() para ver la estructura de cada una de las columnas de la tabla. A continuacion, checaremos cuales son las colonias que tienen mas estaciones alrededor. Para hacerlo, usaremos el package dplyr, seleccionaremos las variables Colonia y nearbyStations6 y usaremos la funcion na.omit() para asegurarnos que la variable nearbyStations6 contenga algun valor. 