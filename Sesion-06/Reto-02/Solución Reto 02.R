leche_mes <- read.csv("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-06/Reto-01/leche_mes.csv")
leche_mes$month <- as.Date(leche_mes$month, format = "%Y-%m-%d")
leche_mes$ano<-format(leche_mes$month, format = "%Y")
leche_mes$mes_num <- format(leche_mes$month, format = "%m")

ggplot(leche_mes, aes(x = mes_num, y = milk_prod_per_cow_kg, group = ano)) + 
  geom_line(aes(colour = ano)) + 
  theme_classic() 
