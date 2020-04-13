##Escriba un bucle for que itere sobre los números del 1 al 7 e imprima el cubo de cada número usando print ().
sec <- 1:7
for(l in sec){
  print(l^3)
}

#Escriba un bucle for que itere sobre los nombres de columna del conjunto de datos de iris . Utilice las siguientes funciones print (), paste().

head(iris)
iris <- iris 
n <- ncol(iris)
for(i in n) {
  print(colnames(iris))
}

#Escriba un ciclo while que imprima números normales aleatorios estándar (use rnorm ()) pero se detiene (breaks) si obtiene un número mayor que 1.

while (TRUE) {
  n <- rnorm(1)
   print(n)
   if(n > 1){
     break()
   }
}


#El siguiente uso adapta el bucle del último ejercicio para que no imprima números negativos.


while (TRUE) {
  n <- rnorm(1)
  if(n > 0){
    print(n)    
  }
  if(n > 1){
    break()
  }
}