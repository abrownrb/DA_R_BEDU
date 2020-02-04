`Data Science` > [`Programacion con R`]
## Visualizacion, graficos y tablas

### OBJETIVO
- Aprender a crear un boxplot

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion05/Ejemplo-03`

#### DESARROLLO

Importamos la base de datos de muestra airquality
Importaremos la libreria ggplot2
Crearemos un boxplot para evaluar la variable Temp (Temperara máxima en gradis F)
```{r}
??airquality

#Temp Temperatura máxima en grados Fahrenheit en Aeropuerto La Guardia.
airquality$Month <- factor(airquality$Month,
                           labels = c("May", "Jun", "Jul", "Aug", "Sep"))

print(airquality$Month)
ggplot(airquality, aes(x = Month, y = Temp)) +
  geom_boxplot() 
```
