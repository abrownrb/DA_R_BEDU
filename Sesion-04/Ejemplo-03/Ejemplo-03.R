
datos <- iris
head(iris)
## Visualización comparativa
plot(datos[,-5], main="Gráfica de todos contra todos")

# Scatterplot
datos %>% 
  ggplot(aes(Sepal.Length, Sepal.Width))+
  geom_point()+
  theme(legend.position = "none")

datos %>% 
  ggplot(aes(Sepal.Length, Sepal.Width))+
  geom_point(aes(col = Species))+
  theme(legend.position = "none")

## Histogramas
hist(datos$Sepal.Length,
     main="Histograma de Longitud de sépalo por especie", xlab="Longitud de sépalo")
qplot(Sepal.Length, data=datos, geom='histogram', main="Histograma de Longitud de sépalo",
      xlab="Longitud de sépalo", ylab = 'Frecuencia')
qplot(Sepal.Length, data=datos, geom='histogram', fill=Species,
      main="Histograma de Longitud de sépalo por especie", xlab="Longitud de sépalo")


## Boxplot
irisVer <- subset(datos, Species == "versicolor")
irisSet <- subset(datos, Species == "setosa")
irisVir <- subset(datos, Species == "virginica")
par(mfrow=c(1,3))
boxplot(irisVer[,-5], main="Versicolor",ylim = c(0,8),las=2)
boxplot(irisSet[,-5], main="Setosa",ylim = c(0,8),las=2)
boxplot(irisVir[,-5], main="Virginica",ylim = c(0,8),las=2)
