######################################
########## Fundamentos de R ##########
##########    Sesi�n 01     ##########
##########  Ejercicio 02    ##########
######################################

# Para crear un dataframe
df.example <- data.frame(clave = c(1,2,3),
                             grado = c(4,4,5),
                             sexo = c('F','M','M'))


# Utilizaremos el dataset iris
iris

# Para ver el n�mero de renglones de un dataframe utilizamos nrow
nrow(iris)

# Para ver el n�mero de columnas de un dataframe utilizamos ncol
ncol(iris)
length(iris)
# Para ver el n�mero de renglones y columnas de un dataframe utilizamos dim
dim(iris)
nrow(iris)
# Utilizamos paste para imprimir texto y el resultado de c�digo
print(paste('El n�mero de columnas de nuestro dataframe es:', ncol(iris)))
print(paste('El n�mero de renglones de nuesrtro dataframe es:', nrow(iris)))

# Para ver el nombre de las columnas utilizamos names
names(iris)
# colnames(iris) <- c(5 entradas de texto)

# Para traer un elemento de un dataframe debemos darle la ubicaci�n
# Primer rengl�n, primer columna
iris[1,1]
# Tercer rengl�n, primer columna
iris[3,1]
# Tercer rengl�n, segunda columna
iris[3,2]


# Para traer renglones completos de un dataframe
# El primer rengl�n utilizando el n�mero de rengl�n que es
iris[1,]
# Los tres primeros renglones 
iris[1:3,]
# Todos los renglones menos el primero
iris[-1,]


# Para traer columnas completas de un dataframe
# La primer columna por el n�mero de columna que es
iris[,1]
# La primer columna por el nombre de columna que es
iris[,'Sepal.Length']
# La primer columna por el nombre de columna que es
iris$Sepal.Length
# Las primeras dos columnas 
iris[,1:2]
# Todas las columnas menos la primera
iris[,-1]


# Para traer elementos segun renglones y columnas
# Primer rengl�n, dos primeras columnas
iris[1, 1:2]
iris[1, c('Sepal.Length', 'Sepal.Width')]

# Primeros tres renglones, dos �ltimas columnas
iris[1:3, 2:3]

# Primeros tres renglones, primer y �ltima columna
iris[1:3, c(1,3)]
iris[1:3, c('Sepal.Length', 'Petal.Length')]


# Para agreger un nuevo rengl�n utilizamos rbind
iris.parte2 <- data.frame(Sepal.Length = c(6,7),
                                    Sepal.Width = c(2.5,3.5),
                                    Petal.Length = c(3,3),
                                    Petal.Width = c(0.01,2.08),
                                    Species = c('virginica','versicolor'))
iris
iris.parte2

df.iris <- rbind(iris, iris.parte2)
df.iris

# Para agregar una columna 
df.example.newcolumn <- data.frame(calificacion = c(9,6,10))
df.example.newcolumn
df.example <- cbind(df.example, df.example.newcolumn)
df.example

# Para transformar una columna
df.example$calificacion <- df.example$calificacion + 0.5
df.example

# Para transformar una columna y agregar la transformaci�n como una nueva
df.example$nueva <- (df.example$calificacion + 8)/2
df.example

# Para eliminar una columna
df.example$grado <- NULL
df.example


# Funciones �tiles 
# Para ver los primeros 8 elementos del dataframe
head(iris, 8)

# Para ver los ultimos 6 elementos del dataframe
tail(iris)

# Ver los distintos elementos de una columna
unique(iris$Species)

# Cambiar los nombres de las columnas
names(iris) 
names(iris) <- c("Longitud.Sepalo","Ancho.Sepalo","Longitud.Petalo","Ancho.Petalo","Especies")
head(iris)
