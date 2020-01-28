
## Funciones - Estructuras de control. Comandos para automatizar una tarea repetitiva
## IF ELSE --> if (<condition>){do something} else {do something}
# Creamos una variable
N <- 10

# Funcion para comprobar si al multiplicarla por 5 es mayor de >40 
if (N * 5 > 40){
  print("Eso es facil!")
} else {
  print ("Eso es dificil!")
}

# Funcion para comprobar si un numero positivo o negativo
x <- 4
if(x > 0){
  print("Numero positivo")
} else {
  print("Numero negativo")
}

# Funcion para ver cual es el equipo ganador 
EquipoPumas <- 3 # Numero de goles
EquipoChivas <- 1 
if (EquipoPumas > EquipoChivas){
  print ("EquipoPumas gana")
}


## FOR
## for (<search condition>){do something}
# Creamos un vector 
y <- c(99,45,34,65,76,23)
for(i in 1:4){
  print (y[i])
}

# Creamos un vector de frutas
fruta <- c('Manzana', 'Naranja', 'Maracuya')

for (i in fruta){ 
  print(i)
}

## WHILE
# Creamos una condicion para comprobar si es menor de 18 anos
edad <- 12

while(edad < 18){
  print(edad)
  edad <- edad + 1 # Crea un loop hasta que deja de cumplirse la condicion, en que el loop se rompe
}



# Creamos un loop infinito (tendremos que presionar stop para aturarlo)
numero<- 8
while (numero < 10)  {
  print(paste("El numero del loop es:  ", numero))
}


## REPEAT IF BREAK
suma <- 0
repeat{
  suma = suma+1
  print(suma)
  if (suma == 8){
    print("El loop termino");
    break
  }
}



