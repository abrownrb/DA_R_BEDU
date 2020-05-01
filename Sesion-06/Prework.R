mydata <- read.csv('/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-06/P2-Mispriced-Diamonds.csv') 
#haz command + windows o enter después del código para que salga una ventana y que puedas seleccionar la base de datos de tus archivos. En caso de que no puedas, siempre puedes buscar en StackOverflow cómo leer archivos csv desde R studio.
install.packages('ggplot2')
library(ggplot2)
ggplot(data=mydata[mydata$carat<2.5,], 
       aes(x=carat, y=price, colour=clarity)) +
geom_point(alpha=0.6) 

# Datos 
# Aesthetics - Ejes, colores
# Geometrías 
# Facetas 
# Estadistícas
# Coordenadas 
# Temas 
