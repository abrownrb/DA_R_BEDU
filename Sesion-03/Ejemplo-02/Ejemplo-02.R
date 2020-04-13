
head(mtcars)

library(dplyr) 

mtcars <- mtcars 

select(mtcars, 'nombre carro', mpg, hp)

filter(mtcars, grepl("a", 'nombre carro') & hp > 200 )


