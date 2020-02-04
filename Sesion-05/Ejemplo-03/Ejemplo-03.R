??airquality

#Temp Temperatura máxima en grados Fahrenheit en Aeropuerto La Guardia.
airquality$Month <- factor(airquality$Month,
                           labels = c("May", "Jun", "Jul", "Aug", "Sep"))

print(airquality$Month)
ggplot(airquality, aes(x = Month, y = Temp)) +
  geom_boxplot()
