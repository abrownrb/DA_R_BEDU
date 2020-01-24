
head(mtcars)

library(dplyr) 

mtcars <- mtcars 

select(mtcars, 'nombre carro', mpg, hp)

filter(mtcars, grepl("a", 'nombre carro') & hp > 200 )

# elegir los nombres de los coches con hp > 100

base <- mtcars %>% 
  cbind(names)

eleccion <- base %>% 
  select(names, hp) %>%
  filter(hp > 100) %>%
  # select(names) - positvo
  select(-hp) # negativo

base <- mtcars %>% 
  select("mpg","cyl","disp")

base2 <- mtcars %>% 
  select(-c("mpg","cyl","disp"))

base3 <- mtcars %>% 
  select(-mpg,-cyl,-disp)

base4 <- mtcars %>% 
  select(mpg,-cyl,-disp)

mtcars %>% colnames()
