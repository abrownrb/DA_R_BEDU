
library("readxl")
library("dplyr")
ecobici <- read_excel("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/ecobici.xls")
head(ecobici)

ecobici$estacion1 <- ifelse(ecobici$nearbyStations>=1, 1, 0)
ecobici$estacion2 <- ifelse(ecobici$nearbyStations2>=1, 1, 0)
ecobici$estacion3 <- ifelse(ecobici$nearbyStations3>=1, 1, 0)
ecobici$estacion4 <- ifelse(ecobici$nearbyStations4>=1, 1, 0)
ecobici$estacion5 <- ifelse(ecobici$nearbyStations5>=1, 1, 0)
ecobici$estacion6 <- ifelse(ecobici$nearbyStations6>=1, 1, 0)

# Opción 2, mutate
ecobici2 <- ecobici %>% 
  mutate(estacion1=ifelse(nearbyStations>=1, 1, 0),
         estacion2=ifelse(nearbyStations2>=1, 1, 0),
         estacion3=ifelse(nearbyStations3>=1, 1, 0),
         estacion4=ifelse(nearbyStations4>=1, 1, 0),
         estacion5=ifelse(nearbyStations5>=1, 1, 0),
         estacion6=ifelse(nearbyStations6>=1, 1, 0))

# Opción 3, mutate_at
sobrescrito <- ecobici %>% 
  mutate_at(.vars = vars(one_of('nearbyStations','nearbyStations2',
            'nearbyStations3','nearbyStations4',
            'nearbyStations5', 'nearbyStations6')),
            function(x) ifelse(x>=1, 1, 0))

base <- ecobici %>% 
  select(Colonia, estacion1,estacion2,estacion3,estacion4,estacion5,estacion6) %>%
  group_by(Colonia)%>% 
  summarize(sum(estacion1),sum(estacion2),sum(estacion3),sum(estacion4),sum(estacion5),sum(estacion6)) %>%
  arrange(Colonia)
  
                 