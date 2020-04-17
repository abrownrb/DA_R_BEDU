data("iris") # Importamos el dataset de Iris.
head(iris)
library(ggplot2)

ggplot(data=iris,
       aes(Sepal.Length, Petal.Length))


ggplot(iris, aes(Sepal.Length, Petal.Length)) +
  geom_point()

ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
  geom_point()
