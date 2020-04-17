`Data Science` > [`Programacion con R`]
## Exploracion de datos

### OBJETIVO
- Aprender a conocer patrones en un dataset.

#### REQUISITOS
1. Contar con R studio.
2. Usar la carpeta de trabajo `Sesion04/Ejemplo-01`

#### DESARROLLO

Importamos la base de datos de spotify.
Conocer como está estructurado el dataset
Conocer a detalle los datos de cada columna 
Conocer el número de observaciones.
Conocer el número de columnas.
Conocer la media de duración de las canciones en ms.
Conocer la mediana de acústica.
Graficar el historial de casos para conocer en qué rango de minutos existen más registros.

```{r}
head(spotify)
str(spotify)
nrow(spotify)
ncol(spotify)
mean(spotify$duration_ms)
median(spotify$acousticness)

```

Convertir el tiempo en ms a minutos.

```{r}
duracion <- ((spotify$duration_ms/1000)/60)
```
Graficar el historial de casos para conocer en qué rango de minutos existen más registros.

```{r}
set.seed(123)
ejemplo <- rnorm(n = 10000, mean = 0, sd = 1)
hist(duracion, col='orange', breaks=40, 
     ylab = "Frecuencia", main = "Histograma ejemplo")
```
