
ecobici <- read_excel('/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/ecobici.xls')
head(ecobici)

ecobici %>% 
  select(Colonia,nearbyStations6) %>%
  na.omit(nearbyStations6) %>%
  select(Colonia)

ecobici <- ecobici %>%
  mutate(estacion1 = ifelse(ecobici$nearbyStations>=1, 1, 0),
         estacion2 = ifelse(ecobici$nearbyStations2>=1, 1, 0),
         estacion3 = ifelse(ecobici$nearbyStations3>=1, 1, 0),
         estacion4 = ifelse(ecobici$nearbyStations4>=1, 1, 0),
         estacion5 = ifelse(ecobici$nearbyStations5>=1, 1, 0),
         estacion6 = ifelse(ecobici$nearbyStations6>=1, 1, 0))

cuantas <- ecobici %>%
  filter(Colonia %in% c('Lomas Virreyes',
                        'Anzures',
                        'Anahuac Mariano Escobedo')) %>%
  select(Colonia, estacion1,estacion2,estacion3,estacion4,estacion5,estacion6) %>%
  group_by(Colonia) %>% 
  mutate(numero_estaciones = sum(estacion1+estacion2+estacion3+estacion4+estacion5+estacion6, na.rm = TRUE)) %>%
  summarise(numero_estaciones=sum(numero_estaciones,na.rm = TRUE)) 


plot(table(ecobici$Colonia), 
     ylab = "Número de estaciones", 
     xlab = 'Colonia',
     main = "Estaciones por colonia")

                 