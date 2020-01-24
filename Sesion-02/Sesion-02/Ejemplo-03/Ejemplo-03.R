 
head(iris)
library
iris <- iris 
iris %>% 
  group_by(Species) %>%
  summarise(Media_Sepal_Length = mean(Sepal.Length), 
            Media_Sepal_Width = mean(Sepal.Width)) %>% 
  arrange(Species)

# hacer suma por especie de long y ancho petalo
res <- iris %>% 
  group_by(Species) %>%
  mutate(suma = Petal.Length+Petal.Width)
  
  
  
  # select, arrange, mutate, group_by, summarise, filter
  
  


summary(iris)

rm(iris) # borra del ambiente

