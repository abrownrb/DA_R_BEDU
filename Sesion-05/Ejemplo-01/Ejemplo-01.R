
#Cargamos el DS de NBA en un objeto llamado nba.
nba <- read.csv('/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-05/NBA_players_by_season.csv')
head(nba)
#Filtramos el DS por nacionalidad y obtenemos los jugadores mexicanos.
mxplayer <- nba %>% 
  filter(Nationality == 'Mexico')
print(mxplayer)
#Filtramos el DS resultante para obtener datos de Gustavo Ayon.
ayon<- mxplayer %>% 
  filter(Player == 'Gustavo Ayon')
print(ayon)
#Seleccionamos  del DS resultante las columnas: Player, Season.short y Games.
games <- ayon %>% 
  select(Player, Season.short, Games)
print(games)
#Utilizando librería ggplot2.
#Realizamos una gráfica que nos muestre cada año los juegos ganados y perdidos en la misma columna.

ggplot(games, aes(fill=Games, y=Games, x=Season.short))+
  geom_bar(position = "stack", stat = "identity")
  

