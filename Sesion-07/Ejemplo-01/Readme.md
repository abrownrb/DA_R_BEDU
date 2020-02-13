`Data Science` > [`Programacion con R`]
## Ejercicios practicos (storytelling); Kaggle

### OBJETIVO
- Aprender a estructurar un problema 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion07/Ejemplo-01`

#### DESARROLLO

El codigo para ver este ejercicio lo cubriremos a lo largo de la teoria. Sin embargo, aqui tenemos que investigar la informacion de la encuesta anual de ciencia de datos y machine learning de Kaggle. 

El objetivo es contar la hstoria de los miembros de esta comunidad en México y en el mundo para motivar a los alumnos.

Para comenzar, vamos a cargar la librería tidyverse:

```
library(tidyverse)
```

Ahora, es necesario que descarguen los datos del archivo `multiple_choice_responses.csv` y `multiple_choice_responses_DICT.csv` que contienen las respuestas a las preguntas de opción múltiple y el diccionario de las variables correspondientes.

Carguemos los datos al entorno:

```
mc_responses <- read.csv("~/BEDU_DA/multiple_choice_responses.csv")
```

Como ya vimos, queremos conectar con el contexto de nuestra audiencia. Por lo que vamos a comenzar por identificar la distribución de data scientists por género: 

```
mc_responses %>% as.factor() %>% summary()

ggplot(data = mc_responses, aes(x = Q2, fill = Q2)) +
  geom_bar() +
  scale_fill_manual(values=c("#D69CE1", "#037ffc", "#03fc98","#03fc98")) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6),legend.position = "none") +
  xlab('genero')+
  ylab("numero de usuarios")
```
