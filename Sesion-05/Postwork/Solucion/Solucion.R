library(tidyverse)
#Mejora la gráfica del dataset de iris.
iris %>%
  ggplot(aes(Sepal.Length, Sepal.Width, color = Species, shape = Species)) +
  geom_point() +
  geom_density2d() +
  ggtitle('IRIS') +
  theme_light()

#Agrega facetas (facet_grid()) y geom_smooth para conseguir separar por specie las gráficas.
  iris %>%
  mutate(Species = 'ALL') %>%
  bind_rows(iris) %>%
  ggplot(aes(Petal.Length, Petal.Width, color = Species)) +
  geom_point() +
  geom_smooth() +
  xlab('Petal Length') +
  ylab('Petal Width') +
  facet_wrap(~Species, scales = 'free') +
  theme_bw()