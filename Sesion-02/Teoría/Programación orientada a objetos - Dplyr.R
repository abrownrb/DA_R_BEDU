
## Introduccion al package dplyr 
install.packages("dplyr")
library(dplyr)

# Dplyr nos ayudara a hacer consultas, agregaciones y filtros de datos de manera rapida
# Su uso es similar al de SQL (dispone de funciones como select, left join, inner join y group by)
# Ademas, dispone de algunas propias (filter, summarise, arrange y mutate)

# Importamos el fichero llamado data para poder operar con el a continuacion 
datos <- read.csv("data.csv", header=TRUE)
head(data) # Para visualizar los primeros registros 

# Muestra aleatoria de la base. El segundo componente indica el numero de filas que queremos
# Atencion! Esta muestra aleatoria cambiara cada vez que ejecutemos el codigo, por lo que los resultados
# del analisis variaran 
sample_n(datos,8)

# Tambien podemos importar informacion de manera aleatoria pero indicando el porcentaje que deseamos
sample_frac(datos,0.1) # 10%

# Si dudamos de la existencia de duplicados, podemos usar la funcion distinct
distinct(datos)

# Para seleccionar informacion especifica de la tabla 
select(datos, Indice, Estado, A2008)

# Si nos es mas facil indicar que queremos llevar todas las variables excepto alguna/s, lo indicaremos 
# con el simbolo "-" delante de la variable
select(datos, -Indice, -Estado) # en este caso, solo el indice y el Estado seran omitidos 

# Tambien podemos filtrar segun el primer caracter 
select(datos, starts_with("A")) # Importara toda la informacion que contienen los anos 
select(mydata, -starts_with("A")) # Esta funcion traera la informacion complementaria al comando anterior

# Una de las maneras para cambiar el nombre de las columnas es la funcion rename
rename(datos, Indice1 = Indice)
datos <- rename(datos, Indice1 = Indice) # Asi logramos que los cambios se guarden 

# La funcion filter facilita la filtracion de informacion 
filter(datos, Indice1 == "A") # Informacion de aquellos Estados que su indice es "A"

# Multiples criterios de seleccion
filter(datos, Indice1 %in% c("A", "B")) 

# Filtrar por varias variables separando los comandos por "&" 
filter(datos, Indice1 %in% c("A", "B") & A2008 >= 1300000 )

# Para indicar condiciones disyuntivas (equivalente a "or" en SQL, seria "|" ) 
# Solo tiene que cumplir una de ambas condiciones para ser fitrado 
filter(datos, Indice1 %in% c("A", "B") | A2008 >= 1300000)

# Al igual que SQL, el simbolo "!" indica que no esta/cumpla una condicion
filter(datos, !Indice1 %in% c("A", "B"))

# La funcion grepl ayuda a extraer informacion de un campo en particular 
filter(datos, grepl("kan", Estado)) # Informacion de aquellos estados que contengan "kan" 

# Summarise es una funcion muy util para hacer operaciones rapidas sobre variables
summarise(datos, A2012_mean = mean(A2012)) # Media de todos los estados en 2012 

# Summarise_at nos permite escribir varias condiciones de agrupacion de las operaciones 
summarise_at(datos, vars(A2012, A2013), funs(n(), mean, median))

# Funcion arrange para ordenar informacion segun varias variables
arrange(datos, Indice1, A2012) # Por defecto, esta ordenacion es ascendente 

# Otra manera de separar varias funciones es usar "%>%"
datos %>%
  group_by(Indice1)%>%
  summarise(Media2012 = mean(A2012, na.rm=TRUE), #NA remove para evitar tener registros vacios que sesguen la informacion 
            Media2014 = mean(A2014, na.rm=TRUE)) %>%
  arrange(desc(Media2012)) 

