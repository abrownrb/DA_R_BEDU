#El comando STR deplegara la estructura de nuestro data set

str(mtcars)

#Para identificar el tipo de dato de un objeto, utilizaremos class

class(mtcars$vs)

#Cambiaremos el tipo de dato integer a logical 

mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)

#Validaremos los cambios de tipo de dato

class(mtcars$vs)
class(mtcars$am)

summary(mtcars)

#Transformación de valores

wt <- (mtcars$wt*1000/2.204623)
wt

##Transformación del dataset

mtcars.new <- transform(mtcars, wt = wt * 1000 / 2.204623)

summary(mtcars)
