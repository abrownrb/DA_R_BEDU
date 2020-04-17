`Data Science` > [`Programacion con R`]
## Exploracion de datos

### OBJETIVO
- Aprender herramientas para poder explorar diferentes tipos de dataset.

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion04/Ejemplo-02`

#### DESARROLLO

Importamos la base de datos de muestra iris.
Importaremos la libreria ggplot2

Veamos cómo se construye capa por capa un gráfico utilizando ggplot2 y los datos de iris. Para entender cómo funciona, es importante entender el argumento aes(), que permite indicar qué pondremos en los ejes y además permite agregar distintas capas extra. Veamos el ejemplo:

```{r}
library(ggplot2)

ggplot(data=iris,
       aes(Sepal.Length, Petal.Length))
```
Este gráfico contiene los ejes que especificamos pero no contiene los datos. Para dibujarlos, debemos decirle a ggplot cómo hacerlo (por ejemplo, puntos). 

```{r}
ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  geom_point()
```

Al parecer, los datos presentan una estructura de asociación entre el largo de los sépalos y el de los pétalos (a mayor largo de sépalos, mayor largo de pétalos). Este dataset contiene un factor Species con tres niveles, setosa, versicolor, virginica. Fácilmente podemos ver si las distintas especies presentan distintas asociaciones. Una forma rápida de visualizarlo es coloreando los puntos según el nivel del factor Species. En ggplot2 usamos color = Species.

```{r}
ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point()
```

