`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
- Transformar una variable a serie de tiempo 
- Sacar un plot basico de esta serie de tiempo

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Reto-01`

#### DESARROLLO
Para este reto, nuestro dataset de ecobici no tiene informacion temporal, por lo que usaremos "leche_dia" y "leche_mes" que ya estan en la ruta `Sesion06/Reto-01`. Seguiremos los siguientes pasos: 
* Importaremos los fichero .csv
* Veremos su estructura
* Si el mes (month) no es de clase Date sino factor, los convertiremos con la funcion as.Date(variable a convertir, format = "%Y-%m-%d") en el caso de los meses 
* Con la funcion as.POSIXct(variable a convertir, format = "%Y-%m-%d %H:%M:%S") nos aseguraremos que el formato lea hasta los desgloses para la variable date_time de la tabla leche_dia
* Sacaremos un plot simple de ambas tablas 
* Opcional: sacar un grafico mas elavorado para la tabla leche_mes con la funcion ggplot(variable, aes(x = variablex, y = variabley)) + geom_line() + scale_x_date(date_labels = "%Y", date_breaks = "1 year") + theme_classic()


