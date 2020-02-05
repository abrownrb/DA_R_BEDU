
# Creando visualizacion de datos

# Leemos el fichero .csv de cars 
cars <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-05/Teoría/Cars.csv")

# Cargamos el paquete ggplot2, esencial para la visualizacion
install.packages("ggplot2")
library(ggplot2)

# Creamos un grafico de barras de frecuencia
ggplot(
  data = cars, 
  aes(x = Transmission)) + 
  geom_bar() +
  ggtitle("Count of Cars by Transmission Type") +
  xlab("Transmission Type") +
  ylab("Count of Cars")

# Creamos un histograma
ggplot(
  data = cars, 
  aes(x = Fuel.Economy)) +
  geom_histogram(
    bins = 10) +
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Count of Cars")

# Creamos un grafico de densidad 
ggplot(
  data = cars, 
  aes(x = Fuel.Economy)) +
  geom_density() +
  ggtitle("Distribution of Fuel Economy") +
  xlab("Fuel Economy (mpg)") +
  ylab("Density")

# Creamos un scatterplot
ggplot(
  data = cars, 
  aes(
    x = Cylinders,
    y = Fuel.Economy)) +
  geom_point() +
  ggtitle("Fuel Economy by Cylinders") +
  xlab("Number of Cylinders") +
  ylab("Fuel Economy (mpg)")



## Importamos la Data (data online)
data <- read.csv("http://goo.gl/G1K41K")  

## Primera exploracion
head(data)

## Visualizacion - Scatterplot: Util para checar la correlacion entre variables
vis <- ggplot(data, aes(x=area, y=poptotal)) + 
  geom_smooth(method="loess", se=T) + #Regresion loess, regresion local
  geom_point(aes(col=state, size=popdensity)) + 
  ylim(c(0, 300000)) + 
  xlim(c(0, 0.1)) + 
  labs(title="Area Vs Poblacion", 
       y="Poblacion", 
       x="Area", 
       caption = "Fuente de datos: Oeste USA")

vis


## Scatterplot senalando con un circulo parte de las observaciones
install.packages("ggalt")
library(ggalt)
data_seleccion <- data[data$poptotal > 340000 & 
                         data$poptotal <= 490000 & 
                         data$area > 0.01 & 
                         data$area < 0.1, ] # Que funcion tiene la coma? Que estamos seleccionando? 

data_seleccion # Ya hemos filtrado los datos segun nuestras condiciones, sin limitacion de columnas, todas las variables

## Visualizacion sobre nuestra seleccion de datos
ggplot(data, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state, size=popdensity)) +   
  geom_smooth(method="loess", se=T) + 
  xlim(c(0, 0.1)) + 
  ylim(c(0, 500000)) +
  geom_encircle(aes(x=area, y=poptotal), 
                data=data_seleccion, 
                color="green", 
                size=2, 
                expand=0.06) +  
  labs(title="Seleccion de datos", 
       subtitle="Area Vs Poblacion", 
       y="Poblacion", 
       x="Area", 
       caption="Fuente de datos: Oeste USA") # Alguien sabe por que ahora no tengo que hacer la llamada para ver el plot?


## Visualizacion con Jitter
## Importamos la data
head(mpg)
data2 <- read.csv("http://goo.gl/uEeRGu")  

## Primera exploracion
head(data2)

## Scatterplot - correlacion entre kilometraje en ciudad (cty) y kilometraje en autopista (hwy, highway)
vis <- ggplot(data2, aes(cty, hwy))+ geom_point() 
vis

## Scatterplot con regresion lineal 
vis + geom_point() + 
  geom_smooth(method="lm", se=F) +
  labs(subtitle="kilometraje ciudad Vs. kilometraje en autopista", 
       x="cty",
       y="hwy", 
       caption="Fuente de datos: Oeste USA") ## Alguien identifica el problema de este plot? 

dim(data2) # 11 variables, 234 registros. Pero... donde estan los 234 puntos en el plot? 

## Solucion 1, scatterplot sin numeros enteros para que no se escondan entre ellos (sobrepongan) --> JITTER 
vis + geom_jitter(width = .4, size=2) +
  labs(subtitle="kilometraje ciudad Vs. kilometraje en autopista", 
       y="hwy", 
       x="cty")

## Solucion 2, en el caso de los puntos sobrepuestos hacer un circulo mas grande en lugar de plasmar todos los puntos
vis <- ggplot(data2, aes(cty, hwy))
vis + geom_count(col="brown", show.legend=T) +
  labs(subtitle="kilometraje ciudad Vs. kilometraje en autopista", 
       y="hwy", 
       x="cty")



## Scatterplot nos ayuda con variables numericas, pero tambien podemos comparar variables categoricas cambiando el color
## o anadir mas variables continuas cambiando el tamano de los circulos 
## Plot de circulos
data2_seleccion <- data2[data2$manufacturer %in% c("audi", "ford", "honda", "hyundai"), ]
data2_seleccion


vis <- ggplot(data2_seleccion, aes(displ, cty)) + 
  labs(subtitle="Desplazamiento Vs. kilometraje")

vis + geom_jitter(aes(col=manufacturer, size=hwy)) + 
  geom_smooth(aes(col=manufacturer), method="lm", se=F)


## Correlograma
install.packages("ggcorrplot")
library(ggcorrplot)

data(mtcars)
matriz_correlaciones <- round(cor(mtcars), 1)
matriz_correlaciones

ggcorrplot(matriz_correlaciones, hc.order = TRUE, 
           type = "lower", 
           lab = TRUE, 
           lab_size = 3, 
           method="circle", 
           colors = c("tomato2", "white", "springgreen3"))

## Grafico de desviaciones
mtcars$`nombre carro` <- rownames(mtcars)  # Anadimos una columna con los nombres de las filas (nombres de los carros)
mtcars$mpg_z <- round((mtcars$mpg - mean(mtcars$mpg))/sd(mtcars$mpg), 2) # Nueva columna con millas por galon normalizadas
mtcars$mpg_type <- ifelse(mtcars$mpg_z > 0, "arriba", "debajo") 
mtcars <- mtcars[order(mtcars$mpg_z), ]  # Ordenamos
mtcars$`nombre carro` <- factor(mtcars$`nombre carro`, levels = mtcars$`nombre carro`)  # Conversion a factor para mantener la ordenacion

ggplot(mtcars, aes(x=`nombre carro`, y=mpg_z, label=mpg_z)) + 
  geom_bar(stat='identity', aes(fill=mpg_type), width=.5)  +
  scale_fill_manual(name="Millaje", 
                    labels = c("Arriba promedio", "Debajo promedio"), 
                    values = c("arriba"="#00ba38", "debajo"="#f8766d")) +
  coord_flip()




## Graficos de barras ordenados
head(mpg)
cty_mpg <- aggregate(mpg$cty, by=list(mpg$manufacturer), FUN=mean)  # Agregamos
colnames(cty_mpg) <- c("marca", "millaje")  # Cambio nombres columnas
cty_mpg <- cty_mpg[order(cty_mpg$millaje), ]  # Ordenamos
cty_mpg$marca <- factor(cty_mpg$marca, levels = cty_mpg$marca) # Convertimos a factor para mantener el orden   
head(cty_mpg, 4)

ggplot(cty_mpg, aes(x=marca, y=millaje)) + 
  geom_bar(stat="identity", width=.5, fill="tomato3") 



## Histogramas de distribucion 
head(mpg)
vis <- ggplot(mpg, aes(displ)) + scale_fill_brewer(palette = "Spectral")

vis + geom_histogram(aes(fill=class), 
                     binwidth = .1, 
                     col="black", 
                     size=.2)

vis + geom_histogram(aes(fill=class), 
                     bins=5, 
                     col="black", 
                     size=.1) 


