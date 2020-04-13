#Sintaxis basica de bucle.
while (test_expression) {
   statement
}

# Ciclo While ejemplo.

precio <- 20

while(precio <= 2500){
  print(precio)
  precio <- precio + 5 
}

# Iterar un array de cadenas.

v <- c("Hello","while loop")
cnt <- 2

while (cnt < 7) {
   print(v)
   cnt = cnt + 1
}

# Estructura de control dentro de ciclo While.

x <- 0
while(x < 5){
  x <- x+1;
  if (x == 3)
    next; 
  print(x);
  }
