## Recorre una secuencia desde hasta 10 de uno en uno
for (i in 1:10) {
  print (i)
}


#Recorre los valores contenidos en el vector
for (n in c(2,5,10,20,50)) {
print(n)
}

#Recorre los valores contenidos en el vector de Strings.
arrayString <- c("Loops.","ForLoop","WhileLoop","DoWhileLoop","WhileLoop")
for (n in arrayString) {
print(n)
}


#Recorre los valores contenidos en el data frame.
head(mtcars)
mtcars <- mtcars 
for(i in 1:nrow(mtcars)) {print(mtcars$model[i])}
