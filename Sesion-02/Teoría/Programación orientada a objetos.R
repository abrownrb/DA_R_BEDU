
## Tipo de objetos
# Character
# Numeric (Numeros Reales)
# Integer (Numeros Enteros)
# Complex (Numeros complejos)
# Logical (True / False)
x <-1
class(x)   #numero

y <-"a"
class(y)   #caracter

edad <- c(22, 34, 29, 25, 30, 33, 31, 27, 25, 25) #vector numerico
class(edad)
edad[edad>=25] 

letras <- c("a","b","c","d","e") #vector de caracteres 
letras
class(letras)

mezcla<-c(1,2,3,"a","b","c") #vector alfanumerico 
mezcla
class(mezcla)

## Acceso a los componentes de un vector 
letras[4] #cuarto componente 
letras[2:5] #valores 2, 3, 4 y 5 de un vector 
letras[c(2,3,4,5)]
letras[c(1,3,5)] #valores 1, 3 y 5 de un vector 

length(letras)

## Matrices: vectores con filas y columnas (elementos de la misma clase)
## Matriz de tres filas y dos columnas 
my_matrix <- matrix(1:6, nrow=3, ncol=2)
?matrix
my_matrix  

my_matrix2 <- matrix(c(1,2,4,6,8,6), nrow=3, ncol=2, byrow=TRUE)
my_matrix2

colnames(my_matrix2) <-c("Elena","Silvia")
my_matrix2
rownames(my_matrix2)<-c("Portugal","Espana","Mexico")
my_matrix2

## Acceso a los componenentes de una matriz 
my_matrix2 [,2]   #Secunda columna
my_matrix2 [,1]   #Primera columna
my_matrix2 [2,]   #Segunda fila
my_matrix2 [1,]   #Primera fila
my_matrix2 [1,1]   #Entrada de la primera fila,primer colmuna
my_matrix2 [1,1] <- 7

## Data Frame: listas de vectores que contienen diferentes clases de elementos 
df <- data.frame(Nombre = c("Paula","Ana","Jorge","Silvia"), 
                 Puntos = c(38,18,82,88),
                 stringsAsFactors = TRUE)
df
class(df)
df[1,1]

str(df) #Estructura
summary(df)
nrow(df)
ncol(df)

## Acceso a las columnas de un data frame
mean(df$Puntos) # Media 

## Creamos otro Data Frame
df <- data.frame(
  Nombre = c("Gato", "Perro", "Vaca", "Cerdo"), 
  Cuantos = c(5, 10, 15, 20),
  EsMascota = c(TRUE, TRUE, FALSE, FALSE))
df

# Indexando data frames por fila y columna 
df[1, 2]

# Indexando data frames por filas
df[1, ]

# Indexando data frames por columna
df[ , 2]
df[["Cuantos"]]
df$Cuantos

# Subsetting data frames
df[c(2, 4), ]
df[2:4, ]
df[c(TRUE, FALSE, TRUE, FALSE), ]
df[df$EsMascota == TRUE, ]
df[df$Cuantos > 10, ]
df[df$Nombre %in% c("Gato", "Vaca"), ]

