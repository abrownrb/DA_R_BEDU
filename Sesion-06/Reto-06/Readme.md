`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
- Transformar las fechas en serie de tiempo
- Descomponer los factores de la serie de tiempo
- Visualizar el grafico de tendencia descompuesta 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Reto-03`

#### DESARROLLO
* Crear una serie de tiempo con la funcion ts() para la variable milk_prod_per_cow_kg donde start = 1962, end = 1975 y periodicidad mensual (freq=12) 
* Descomponemos la tendencia con la funcion stl() para la serie de tiempo que creamos y s.window="period" 
* Visualiza la serie de tiempo y la serie de tiempo descompuesta 