`Data Science` > [`Programacion con R`]
## Visualizacion, graficos y tablas

### OBJETIVO
- Aprender a crear un histograma de categorias 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion05/Ejemplo-01`

#### DESARROLLO

-Cargamos el DS de NBA en un objeto llamado nba.
-Filtramos el DS por nacionalidad y obtenemos los jugadores mexicanos.
-Filtramos el DS resultante para obtener datos de Gustavo Ayon.
-Seleccionamos  del DS resultante las columnas: Player, Season.short y Games.
Utilizando librería ggplot2.
-Realizamos una gráfica que nos muestre cada año los juegos ganados y perdidos en la misma columna.


```{r}
  #Cargamos el DS de NBA en un objeto llamado nba.
nba <- NBA_players_by_season
head(nba)
#Filtramos el DS por nacionalidad y obtenemos los jugadores mexicanos.
mxplayer <- nba %>% 
  filter(Nationality == 'Mexico')
print(mxplayer)
#Filtramos el DS resultante para obtener datos de Gustavo Ayon.
ayon<- mxplayer %>% 
  filter(Player == 'Gustavo Ayon')
print(ayon)
#Seleccionamos  del DS resultante las columnas: Player, Season.short, Games y Games.missed
games <- ayon %>% 
  select(Player, Season.short, Games, Games.missed)
print(games)
#Utilizando librería ggplot2.
#Realizamos una gráfica que nos muestre cada año los juegos ganados y perdidos en la misma columna.

ggplot(games, aes(fill=Games, y=Games, x=Season.short))+
  geom_bar(position = "stack", stat = "identity")
  ```{r}
 
