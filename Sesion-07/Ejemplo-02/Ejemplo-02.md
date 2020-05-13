`Data Science` > [`Programacion con R`]
## Ejercicios practicos (storytelling); Kaggle

### OBJETIVO
- Aprender a estructurar un problema 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion07/Ejemplo-01`

#### DESARROLLO

La variable Q3 contiene el país al que pertenece el encuestado. Vamos a descubrir qué tan grande es el número de científicos de datos en México comparado a los demás países.

Usemos el verbo summarise de dplyr para crear un data frame con el número de usuarios por categoría de Q3 (país).

```
summ <- mc_responses %>% group_by(Q3) %>% summarise(users = length(Q3)) 
```

Ordenémos los resultados de forma descendiente según el número de usuarios.

```
summ <- summ[order(-summ$users),]
```

Ahora, vamos a generar una visualización efectiva para nuestra historia:

```
summ %>% ggplot() +
  geom_bar(aes(x = reorder(Q3, users), y = users, fill=reorder(Q3, users)), stat = 'identity') 
```

Son muchas barras que pueden confundir a la audiencia, intentemos con el los países del top 50:

```
p <- summ[1:50,] %>% ggplot() +
  geom_bar(aes(x = reorder(Q3, users), y = users, fill=reorder(Q3, users)), stat = 'identity') 
p
```
  
Ahora vamos a transponer la gráfica para poder 
```
p <- p + coord_flip()
p
```

Mucho mejor, ahora vamos a resaltar el resultado de México para obtener una visualización efectiva con respecto al contexto de nuestra audiencia.

```
p <- p +
  geom_text(aes(x = reorder(Q3, users), y = users,label=users), hjust=-0.1) +
  annotate("text", x = 31.1, y=750, label = "<- lugar 20!") +
  scale_fill_manual(values=c(rep('#8D8A89',30), "#208600",rep('#8D8A89',length(unique(mc_responses$Q3))-31))) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6),legend.position = "none") +
  xlab('top 50 paises')+
  ylab("numero de usuarios")
```
