nba <- read.csv('/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-05/NBA_players_by_season.csv')

#Obtener jugadores estadounidenses y sus edades.
usplayers <- nba %>% 
  filter(Nationality=='United States') %>% 
  select(Age, Nationality)
print(usplayers)
#Imprimir el conteo de las edades.
ggplot(data=usplayers, aes(x=as.numeric(as.character(Age))))+
  geom_density(aes(y=(..count..))) +
  xlab('Edad') + ylab('Número de jugadores')
 
hist(as.numeric(as.character(usplayers$Age)), 
     breaks = 100,
     xlab='Edad',
     ylab='Número de jugadores',
     main = '')
