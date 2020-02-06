`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
- Mejorar la visualizacion con colores creando distincion temporal entre meses y años

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Reto-02`

#### DESARROLLO

Seguiremos trabajando sobre nuestra tabla de la leche. Ahora haremos extracciones dentro de las fechas para hacer una distinción entre año y mes en nuestra tabla "leche_mes". Pasos a seguir:

 * Crear variable año con la función format(variable, format="%Y")
 * Crear variable mes_num con la función format(variable, format="%m")
 * Visualización con ggplot donde el eje de las x es mes_num, las y es milk_prod_per_cow_kg y las líneas varían de color segun el ano con la función --> ggplot(tabla, aes(x= variablex, y=variabley)) + geom_line(aes(colour = año)) + theme_classic() 
© 2019 GitHub, Inc.

