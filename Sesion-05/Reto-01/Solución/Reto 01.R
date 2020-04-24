# 1. Crea una función que reciba de argumento un nombre y devuelve 
# 'Bienvenido -nombre', ponle a la función el nombre de welcome
# 2. Pruebala con tu nombre
# 3. Pide ayuda con la función readline, es decir corre ?readline. 
# Explica el código:
# nombre <- readline(prompt = '¿Cuál es tu nombre?')
# welcome(nombre)
# 4. Modifica tu función welcome para que, además de nombre, pida edad. 
# Ahora, debera regresar 'Bienvenido -nombre- con -edad- años'. 

operacion.personalizada <- function(a,b,c){
  paso.1 <- (a+b)*4 + 2*a
  paso.2 <- paso.1**2 + c/2
  paso.3 <- paso.2**3
  return(paso.3)
}

saludo <- function (nombre){
  mensaje <- paste('Bienvenido', nombre)
  return(mensaje)
}

resultado <- saludo('alicia')

# paste o paste0
# readline es antes de la función

# Declaramos una función

welcome <- function(nombre){
  mensaje <- paste('Bienvenido', nombre)
  return(mensaje)
}

# Llamada a la función
saludo('Alicia')

?readline
nombre <- readline(prompt = '¿Cuál es tu nombre?')
welcome(nombre)
# Readline, lee el texto desde la terminal.
# Lo regresa como un vector de una entrada.
# Con un máximo por deafault de máximo 256 chars.
# Prompt, se imprime en la terminal como instrucción al usuario.

welcome.2 <- function(nombre, edad){
  mensaje <- paste('Bienvenido', nombre, 'con', edad,'años')
  return(mensaje)
}

nombre <- readline(prompt = '¿Cuál es tu nombre?')
edad <- readline(prompt = '¿Cuántos años tienes?')

welcome.2(nombre,edad)


# FOR 

# Escribir un loop doble en el que se impriman 30 números
# Del 1 al 10, del 2 al 11 y del 3 al 12. 

# 1 2 3...10 2 3 4... 11 3 4 5 ... 12

# for(variable in objeto en el que iterar){
 # instrucciones que seguir para cada iteración
# }
# se pueden anidar for(){for(){}}
# opcional hacerlo como función

for(i in 1:2){
  for(j in 1:5){
    print(j+i-1)
  }
}

prueba_fors <- function(tamanio_sec,num_sec){
  for(i in 1:num_sec){
    for(j in 1:tamanio_sec){
      print(j+i-1)
    }
  }
}

prueba_fors(10,3)
prueba_fors(5,2)
