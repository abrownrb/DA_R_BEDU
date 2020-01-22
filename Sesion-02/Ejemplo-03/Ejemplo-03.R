 
head(iris)
library
iris <- iris 
iris %>% 
  group_by(Species) %>%
  summarise(Media_Sepal_Length = mean(Sepal.Length), 
            Media_Sepal_Width = mean(Sepal.Width)) %>% 
  arrange(Species)
