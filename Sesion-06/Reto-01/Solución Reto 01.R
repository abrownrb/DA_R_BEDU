
leche_mes <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-06/Reto-01/leche_mes.csv")
head(leche_mes)
str(leche_mes)
leche_mes$month <- as.Date(leche_mes$month, format = "%Y-%m-%d")
plot(leche_mes)

leche_dia <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-06/Reto-01/leche_dia.csv")
head(leche_dia)
str(leche_dia)
leche_dia$date_milk <- as.POSIXct(leche_dia$date_time, format = "%Y-%m-%d %H:%M:%S")
plot(leche_dia)

ggplot(leche_mes, aes(x = month, y = milk_prod_per_cow_kg)) + 
  geom_line() + 
  scale_x_date(date_labels = "%Y", date_breaks = "1 year") + 
  theme_classic()

