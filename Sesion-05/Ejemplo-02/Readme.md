`Data Science` > [`Programacion con R`]
## Visualizacion, graficos y tablas

### OBJETIVO
- Aprender a crear un grafico de composición. 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion05/Ejemplo-02`

#### DESARROLLO

Importamos la base de datos de NBA
Importaremos la libreria ggplot2
Crearemos un grafico de composición para mostrar las nacionalidades que tengan más de 50 jugadores en la NBA.

```{r}
#Cargamos el DS de NBA en un objeto llamado nba.
nba <- NBA_players_by_season
head(nba)
#Obtener la cantidad de jugadores por nacionalidad.
naciones <- nba %>%
  group_by(Nationality) %>%
  summarize(count=n())
print(naciones)

#Eliminar estados unidos y nulos
naciones <- naciones[-c(1),]
naciones <- naciones[-c(68),]
#Filtrar nacionalidades con menos de 10 jugadores.
naciones <- naciones %>% 
  filter(count > 50)
#Obtener la suma total de los jugadores.
totalPlayers <- sum(naciones$count)
print(totalPlayers)

#Crear una nueva columna con los porcentajes del total de jugadores
naciones$percentage <- (naciones$count * 100)/totalPlayers

#piechart
ggplot(naciones, aes(x="", y=percentage, fill=Nationality)) +
  geom_bar(stat="identity",color="white") +
  coord_polar("y", start=0) +
   theme(legend.position="none") +
     geom_text(aes(label = paste(Nationality, '', round(percentage, digits = 2), '%')), position = position_stack(vjust = 0.2)) +
       scale_fill_brewer(type = "seq")



```
