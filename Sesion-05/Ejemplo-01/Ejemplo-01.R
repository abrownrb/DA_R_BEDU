# Declaramos una función
operacion.personalizada <- function(a,b,c){
  paso.1 <- (a+b)*4 + 2*a
  paso.2 <- paso.1**2 + c/2
  paso.3 <- paso.2**3
  return(paso.3)
}

# Llamada a la función
operacion.personalizada(1,2,3)
operacion.personalizada(7,8,9)
