nba <- read.csv('/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-05/NBA_players_by_season.csv')

print(usplayers)
#Obtener jugadores estadounidenses y sus edades.
usplayers <- nba %>% 
  filter(Nationality=='United States') %>% 
  select(Age, Nationality)

#Imprimir el conteo de las edades.
ggplot(data=usplayers, aes(x=Age))+
  geom_bar(aes(y=(..count..)))+
    geom_text(stat='count', aes(label=..count..), vjust=-1)

