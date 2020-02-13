`Data Science` > [`Programacion con R`]
## Ejercicios practicos (storytelling); Kaggle

### OBJETIVO
- Aprender a contar una historia con los datos

#### DESARROLLO

La variable Q10 contiene el rango de ingreso en USD anuales que reportó el encuestado. 

Vamos a explorar cuál es el salario de los científicos de datos en México, en nuestro rango de edad.

Como la variable Q10 es categórica, probemos con una gráfica de waffle. Para eso es necesario instalar y cargar los siguientes paquetes.

```
install.packages(waffle)
install.packages(magrittr)
install.packages(hrbrthemes)

library(waffle)
library(magrittr)
library(hrbrthemes)
```
Ahora, empecemos por filtrar los valores nulos, los usuarios en el rango de edad '25-29' y que viven en México.

```
filtered <- mc_responses %>% filter(Q1 == '25-29' & Q10 != '' & Q3 == 'Mexico')
```

Las gráficas de waffle o de retícula, son una forma muy efectiva de visualizar la proporción de miembros de una categoría dentro de una sola variable categórica.
Por lo que primero vamos a preparr un dataframe con la suma de miembros de cada clase.

```
counted <- filtered %>%
  count(Q10)
```

Ahora sí, vamos a usar la sintaxis de ggplot para crear una gráfica de waffle:

```
counted %>%  
  ggplot(aes(fill = Q10, values = n)) +
  geom_waffle(n_rows = 5, size = 0.33, colour = "white", flip = TRUE) +
  coord_equal() +
  theme_ipsum_rc(grid="") +
  ggtitle('Composición del ingreso de los kagglers en edad 25-29 (USD anual)') +
  theme_enhance_waffle() +
  scale_fill_brewer(palette="Paired")

```

En cada ejemplo intenta identificar cómo se usan las diferentes capas y sus parámetros.
