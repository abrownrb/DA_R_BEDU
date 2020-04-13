## Crear una función que reciba un array de numeros positivos y utilizando if/else 
## determine cual es el valor mayor en el array

mayor <- function(array){
  numero <- 0
  for(i in array){
    if(i >  numero){
      numero <- i;
    }
  }
  print(numero)
}

mayor(c(10, 12, 2, 394, 244,23))
