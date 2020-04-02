######################################
########## Fundamentos de R ##########
##########    Sesi�n 01     ##########
##########  Ejercicio 01    ##########
######################################

# Declaramos una variable de cada tipo de dato
variable.char <- 'Hola R'
variable.num <- 3.1416
variable.int <- 149213L
variable.logical <- TRUE

# Imprimimos las clases de cada variable
print(class(variable.char))
print(class(variable.num)) 
print(class(variable.int))
print(class(variable.logical))


# Para crear un vector
vector.part1 <- c(1,2,3,4,5)
print(vector.part1)

vector.part2 <- c(7,8,9,10)
print(vector.part2)


# Para agregar un elemento a un vector
vector.complete <- c(vector.part1, 6)
print(vector.complete)


# Para crear un vector utilizando otros vectores y elementos
vector.complete <- c(vector.part1, 6, vector.part2)
print(vector.complete)


# Para crear un vector con secuencia 
vector.seq.byone <- seq(from=1, to=10, by=1)
print(vector.seq.byone)

vector.seq.bytwo <- seq(from=1, to = 10, by=2)
print(vector.seq.bytwo)

vector.seq.negative <- seq(from = 10, to = 1, by=-1)
print(vector.seq.negative)


# Para crear un vector con valores repetidos
vector.rep <- rep(x=1, times = 3)
print(vector.rep)

vector.rep.each <- rep(x = c(1,2), each = 3)
print(vector.rep.each)

vector.rep.complete <- rep(x=c(1,2), each = 3, times = 2)
print(vector.rep.complete)


# Para ordenar ascendente y descendente un vector
vector.sorted.increasing <- sort(vector.rep.complete)
print(vector.sorted.increasing)

vector.sorted.decreasing <- sort(vector.rep.complete, decreasing = TRUE)
print(vector.sorted)


# Para ver el tama�o de un vector
length(vector.sorted.decreasing)
length(vector.sorted.decreasing)/2


# Para extraer el primer elemento de un vector
vector.multiply.four[1]

# Para extrar el primer y segundo elemento
vector.multiply.four[1:2]

# Para extraer el primer y tercer elemento
vector.multiply.four[c(1,3)]


# Para extraer el �ltimo elemento del vector
loc.last <- length(vector.multiply.four)
print(loc.last)
vector.multiply.four[loc.last]

# Para extrar el pen�ltimo elemento del vector
vector.multiply.four[loc.last-1]

# Para extrar todos los elementos menos el primero
vector.multiply.four[-1]

# Para extraer todos los elementos menos el �ltimo
vector.multiply.four[-loc.last]

# Para extraer todos los elementos menos el primero y el �ltimo
vector.multiply.four[-c(1, loc.last)]


# Para sustituir el valor de un elemento, por ejemplo el primero
vector.multiply.four[1] <- 100
print(vector.multiply.four)


# Los vectores nos permiten hacer operaciones sobre todo el vector
vector.new <- seq(from = 0, to = 25, by = 5)
print(vector.new)

# Para sumarle un n�mero a todos los elementos del vector
vector.new + 1

# Para multiplicar por un n�mero a todos los elementos del vector
vector.new*10

# Combinamos operaciones y cuidamos el orden de las operaciones
(vector.new + 1)*10

# Sumamos dos vectores
vector.new + rep(1, times = 6)

