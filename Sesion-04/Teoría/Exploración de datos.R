
## TITANIC 

## Librerias 
library(ggplot2)
library(data.table)
library(dplyr)
library(facetas)


# Leer el fichero titanic.csv como un dataframe
setwd("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-04")
csv <- read.csv("Teoría/titanic.csv", header=TRUE)
df <- as.data.frame(csv)

# Calcular el porcentaje de pasajeros que sobrevivio
perc <- sum(df$Survived)/length(df$Survived)*100
perc

#contamos los sobrevivientes
df %>%
  count(df$Survived)

table(df$Survived)

NO_SOBREVIVIO <- 424
SOBREVIVIO <- 290 
TOTAL <- NO_SOBREVIVIO + SOBREVIVIO

PER_SOBREVIVIO <- SOBREVIVIO / TOTAL

# Calcular el porcentaje de missing values en cada uno de los atributos
sapply(df, function(x) sum(is.na(x))) /length (df$PassengerId) * 100

# Eliminar la variable Cabin del dataframe
nocabin <- select(df, -Cabin) 

# Crear una nueva variable Title a partir de Name con los valores Master (hombre soltero), 
# Miss (mujer soltera), Mr. (hombre casado), Mrs. (mujer casada) y Otro a partir de la variable nombre. 
# Es importante tener en cuenta que el ti??tulo Miss esta en ocasiones codificado con su abreviatura en 
# frances Mlle (mademoiselle) y lo mismo ocurre con Mrs., que en ocasiones aparece como Ms. o Mme (madame)
df$Title <- substring(df$Name,regexpr(",",df$Name)+2,regexpr("\\.",df$Name)-1)
df$Title[df$Title %in% c("Master")] <- "Hombre Soltero"
df$Title[df$Title %in% c("Mr")] <- "Hombre Casado"
df$Title[df$Title %in% c("Miss","Mlle")] <- "Mujer Soltera"
df$Title[df$Title %in% c("Mrs","Ms","Mme")] <- "Mujer Casada"
df$Title[!(df$Title %in% c("Hombre Soltero","Hombre Casado","Mujer Soltera","Mujer Casada"))] <- "Otro"
head(df)

# Explorar la relaci??on entre las variables Age y la nueva variable Title mediante un boxplot para cada uno
# de los valores de la misma. ??Tienen alguna relacion? 
boxplot(Age ~ Title, data=df, main = "Relacion entre Edad y Titulo", 
        xlab = "Titulo", ylab = "Edad") ## Las mujeres casadas son, en promedio, de mnas edad que los hombres casados
## Hay una muestra mas pequena de hombres solteros, y son ni,os y adolescentes
## Los hombres casados son los que tienen una oscilacion/diversidad de edad mayor

# Explorar la relacion entre Age, Pclass y Title en varios graficos de dispersion con colores, donde el color 
# representa la supervivencia (Pista: usar facetas)
agepclass <- ggplot(df, aes( x = Pclass, y = Age)) + geom_point()
ageclasssup <- agepclass + geom_point(aes(colour = factor(Survived)))
ageclasssuptit <- ageclasssup + facet_grid (~Title)
ageclasssuptit

# Completar los missing values del atributo Age con la mediana del resto de datos de esa variable pero 
# agrupado de acuerdo a las variables Pclass y Title 
sum(is.na(df$Age)) ## 177 NAs 
df$Age[is.na(df$Age)] <- median(df$Age, na.rm = TRUE)
head(df)


# Despues de realizar las operaciones anteriores, eliminar ahora cualquier fila que tenga al menos un NA.
df <- na.omit(df)
sum(is.na(df))
unique(is.na(df))

# Calcular el porcentaje de missing values en cada uno de los atributos
surperc <- prop.table(table(df$Sex, df$Survived), 1)
surperc ## 74.2% de las mujeres sobrevivio contra un 18.9% de hombres, por lo que hay probabilidad de supervivencia segun el genero

df %>% count(Sex)
n_mujeres <- 314
n_hombres <- 577

probas <- df %>% 
  group_by(Sex, Survived) %>%
  summarise(total = n()) %>% 
  mutate(probabilidades = ifelse(Sex == 'female',
                                 total/ n_mujeres,
                                 total/n_hombres))

# Calcular la probabilidad de supervivencia en base a la edad (Age)
cor(df$Survived, df$Age) # No significativo

agesurv <- ggplot(df, aes( x = Survived, y = Age)) + geom_point()
agesurv # Ninguna conclusion 

boxplot(Age ~ Survived, data=df, main = "Relacion entre Edad y Supervivencia", 
        xlab = "Supervivencia", ylab = "Edad") # Edad no es una variable explicativa ni facil de interpretar

# Crea una nueva variable Decade en el dataframe que con- tenga la decada de la edad de los pasajeros y 
# repite el analisis del apartado anterior sobre esta nueva variable. Pista: funcion cut. 
df$Decade <- cut(df$Age, breaks=c(0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100), right = FALSE)
df$Decade <- as.numeric(df$Decade)

cor(df$Survived, df$Decade)

boxplot(Decade ~ Survived, data=df, main = "Relacion entre Decada y Supervivencia", 
        xlab = "Supervivencia", ylab = "Decada") ## La edad sigue sin ser un factor relevante explicando la probabilidad de supervivencia

# Convertir la variable Survived a un factor con los niveles Yes si ha sobrevivido y No en caso contrario
df$Survived2 <- ifelse(df$Survived < 1, c("No"), c("Yes")) 
head(df)

# Ver la relacion entre la supervivencia y la nueva variable Title con un grafico de barras. 
# En el caso del valor Otros de la variable Title, ??nos proporciona este alguna informacion sobre la supervivencia?. A que se debe?
ggplot(df,aes(x=Survived))+geom_histogram()+facet_grid(~Title)+theme_bw()

ggplot(df,aes(x=Survived,fill=Title))+
  geom_histogram(position="dodge",binwidth=0.25)+theme_bw() # Hombres casados son los que menos sobrevivieron
# Otros no nos proporciona informacion puesto que hay pocos registros

# Crea dos nuevas variables en el dataframe con la siguiente informacion: 
# Familysize: numero total de parientes incluyendo al propio pasajero
# Sigleton: valor logico indicando con valor TRUE si el pasajero viaja solo y FALSE en caso contrario
df$Familysize <- df$SibSp + df$Parch + 1
head(df)

df$Singleton <- ifelse(df$Familysize < 2, c("TRUE"), c("FALSE")) 
head(df)

#  Realizar un grafico de puntos de la variable Age sobre Fare, coloreado por los valores de la variable Survived
ggplot(df, aes(x=Age, y=Fare, color=Survived2)) + geom_point()

# Realizar un histograma para ver la distribucion de las edades
hist(df$Age)

# Representar en un grafico de barras el numero de pasajeros que han sobrevivido para cada uno de los 
# valores de las variables Sex y Pclass.
a<-ggplot(df,aes(x=Survived,fill=Sex))+
  geom_histogram(position="dodge",binwidth=0.25)+theme_bw()

a <- a + facet_grid (~Pclass)
a

# Cuenta el numero de pasajeros por tamano de familia y clase. Por ejemplo, cuantos pasajeros de primera 
# clase pertenecen a una familia de tamano 4. El resultado debe ser un dataframe con la informacion para todas 
# las posibles combinaciones de clase del billete y tamano de familia
data.frame(table(df$Familysize, df$Pclass))

# Representar, en un mismo grafico, dos histogramas de la variable Age, uno para los pasajeros con sexo 
# masculino y otro para los pasajeros con sexo femenino. En caso de que se solapen los histogramas, 
# usar colores con transparencias
ggplot(df, aes(x=Age, color=Sex)) + geom_histogram(fill="white")

# Leer el fichero titanic2.csv, que contiene informacion adicional sobre los pasajeros del barco
# boat: identificador del bote salvavidas 
# body: identificador del cuerpo
# home.dest: Origen/destino
df2 <- read.csv("/Users/aliciabrown/Documents/BEDU/A2-Programacion-con-R-master/Sesion-04/titanic2.csv", header=T, sep=";")
head(df2)

# Para unificar estos dos dataframes, parece buena opcion utilizar la variable name como clave 
# Determina si esta variable es unica por pasajero, mostrando el numero de nombres diferentes repetidos
# En caso de existir varios pasajeros con el mismo nombre, listar aquellas filas del dataframe inicial 
# en las que el nombre del pasajero este repetido
veces <- data.frame(table(df2$name))
veces[veces$Freq > 1,] # Hay dos duplicados

# Combina ambos dataframes utilizando la combinacion del nombre y el numero de billete, 
# manteniendo las mismas filas que el dataframe original
df_total <- merge(df, df2, by.x=c("Name", "Ticket"), by.y=c("name", "ticket"))
head(df_total)

# Que porcentaje de los pasajeros que sobrevivio tiene asociado un identificador del bote salvavidas?
count(subset(df_total, Survived2 == "Yes" & boat !=" "))/
  count(subset(df_total, Survived2 == "Yes")) #94% de los supervivientes tenian un bote asociado

# Separar el conjunto anterior de datos en dos subconjuntos disjuntos de forma aleatoria, el primero conteniendo
# un 70% de los datos y el segundo un 30%. Los resultados tienen que estar contenidos en dos dataframes
particion <- sort(sample(nrow(df_total), nrow(df_total)*.7))
train <- df_total[particion,] #70% de los registros
test <- df_total[-particion,] #30% de los registros




