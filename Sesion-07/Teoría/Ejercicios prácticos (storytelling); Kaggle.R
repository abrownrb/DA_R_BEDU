
# Algoritmo de recomendacion de peliculas
library(recommenderlab)
library(ggplot2)
library(data.table)
library(reshape2)

pelis <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-07/Teoría/movies.csv",
                  stringsAsFactors = FALSE) # Para evitar que se factoricen las variables categoricas
links <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-07/Teoría/busqueda.csv", 
                  stringsAsFactors = FALSE)
puntuacion <- read.csv("/Users/abrownr/Desktop/BEDU/A2-Programacion-con-R/Sesion-07/Teoría/ratings.csv",
                       stringsAsFactors = FALSE)

## Procesamiento de los datos 
generos <- as.data.frame(pelis$genres, stringsAsFactors=FALSE)

generos2 <- as.data.frame(tstrsplit(generos[,1], '[|]', 
                                    type.convert=TRUE),
                          stringsAsFactors=FALSE)

colnames(generos2) <- c(1:10)

tipologia <- c("Action","Adventure","Animation","Children","Comedy",
               "Crime","Documentary", "Drama","Fantasy", "Film.Noir",
               "Horror","Musical","Mystery", "Romance","Sci.Fi",
               "Thriller","War","Western") # 18 generos

matriz_generos <- matrix(0,10330,18) # 10329+1 numero de pelis, 18 numero de generos
matriz_generos [1,] <- tipologia 
colnames(matriz_generos) <- tipologia 

# Matriz de iteracion 
for (i in 1:nrow(generos2)) {
  for (c in 1:ncol(generos2)) {cumple = which(matriz_generos[1,] == generos2[i,c])
    matriz_generos[i+1,cumple] <- 1} } # Asignamos 1 cuando se cumple que tiene esta categoria 

# Creamos un data frame
# No consideramos la primera fila que es la lista de generos
matriz_generos2 <- matriz_generos[-1,]
for (c in 1:ncol(matriz_generos2)) {
  matriz_generos2[,c] <- as.integer(matriz_generos2[,c])
} # Convertimos de caracteres a numeros para distinguir entre 0 y 1 

# Busqueda de pelicula por genero 
anos <- as.data.frame(pelis$title, stringsAsFactors=FALSE)
union <- function(x, n){substr(x, nchar(x)-n+1, nchar(x))}
anos <- as.data.frame(substr(union(union(anos$`pelis$title`, 6),5),1,4))
matriz_busqueda <- cbind(pelis[,1], substr(pelis[,2],1,nchar(pelis[,2])-6), anos, matriz_generos2)
colnames(matriz_busqueda) <- c("movieId", "title", "year", tipologia)
write.csv(matriz_busqueda, "busqueda.csv", row.names = FALSE)
matriz_busqueda <- read.csv("busqueda.csv", stringsAsFactors=FALSE)

# Para comprobar que funciono nuestro algoritmo, buscaremos una pelicula de accion producida el 1995: 
subset(matriz_busqueda, Action == 1 & year == 1995)$title

## Creamos un perfil binario de usuarios
puntuacionbinaria <- puntuacion

## Consideramos que puntuaciones de 4 o 5 corresponden a 1, significando que gustaron, mientras una puntuacion de 3 o menos
## se categorica como -1, significando que no gusto. Eso podemos hacerlo de muchas maneras, en este caso, como un loop: 
for (i in 1:nrow(puntuacionbinaria)){
  if (puntuacionbinaria[i,3] > 3){
    puntuacionbinaria[i,3] <- 1
  }
  else{
    puntuacionbinaria[i,3] <- -1
  }
}

# Convertiremos la matriz de puntuaciones binarias a un formato que funcione para seguir operando
puntuacionbinaria <- dcast(binaryratings, movieId~userId, value.var = "rating", na.rm=FALSE)
head(puntuacionbinaria)
for (i in 1:ncol(puntuacionbinaria)){
  puntuacionbinaria[which(is.na(puntuacionbinaria[,i]) == TRUE),i] <- 0
}
puntuacionbinaria <- puntuacionbinaria[,-1] 
# Invertimos las columnas de movieIds por filas, y las columnas corresponden a userIds


# Eliminamos las pelis no puntuadas de la data de pelis 
pelisIds <- length(unique(pelis$movieId)) # 9,742
pelisconpuntuacion <- length(unique(puntuacionbinaria$movieId)) # 9,724
pelis2 <- pelis[-which((pelis$movieId %in% puntuacionbinaria$movieId) == FALSE),]

# Borramos las pelis sin puntuacion de nuestra matriz generos2
matriz_generos3 <- matriz_generos2[-which((pelis$movieId %in% puntuacionbinaria$movieId) == FALSE),]

# Calculamos el producto de la matriz de generos y las matriz de calificaciones y obtenemos los perfiles de usuario 
resultado <- matrix(0,18,668) # 668 usuarios/evaluadores, 18 tiplologias
for (c in 1:ncol(puntuacionbinaria)){
  for (i in 1:ncol(matriz_generos3)){
    resultado[i,c] <- sum((as.numeric(matriz_generos3[,i]))* (puntuacionbinaria[,c])) # Puntuacion por genero 
  }
}

# Lo convertimos a escala binaria
for (c in 1:ncol(resultado)){
  for (i in 1:nrow(resultado)){
    if (resultado[i,c] < 0){
      resultado[i,c] <- 0
    }
    else {
      resultado[i,c] <- 1
    }
  }
}

## Asumimos que los usuarios tienen las mismas preferencias y gustos
# Jaccard Distance nos ayuda a medir la similitud entre perfiles
# Creamos una matriz con fila userID y columna movieID
puntuacionmatriz <- dcast(puntuacion, userId~movieId, value.var = "rating", na.rm=FALSE)
puntuacionmatriz <- as.matrix(puntuacionmatriz[,-1]) # Eliminamos los userIds

# Metodo: UBCF
# Metodo de calculo de similitudes: similitud de cosenos
# Nearest Neighbors: 30
# Convertimos la matriz de ratings a una matriz sparse 
puntuacionmatriz <- as(puntuacionmatriz, "realRatingMatrix")

# Determinamos la similitud de los cuatro primeros usuarios
# Creamos una matriz de similitud 
similitud_usuarios <- similarity(puntuacionmatriz[1:4, ], 
                               method = "cosine", 
                               which = "users")
as.matrix(similitud_usuarios)
image(as.matrix(similitud_usuarios), main = "Similitud usuarios")

# Similitud entre las cuatro primeras peliculas
similarity_pelis <- similarity(puntuacionmatriz[, 1:4], method =
                                 "cosine", which = "items")
as.matrix(similarity_pelis)
image(as.matrix(similarity_pelis), main = "Similitud pelis")

# Exploramos las puntuacions
vector_puntuacion <- as.vector(puntuacionmatriz@data)
unique(vector_puntuacion) 

tabla_puntuacion <- table(vector_puntuacion) 
tabla_puntuacion

# Visualizamos la puntuacion 
vector_puntuacion <- vector_puntuacion[vector_puntuacion != 0] # Eliminamos puntuaciones de 0 o NAs
vector_puntuacion <- factor(vector_puntuacion)

qplot(vector_puntuacion) + 
  ggtitle("Distribucion de puntuaciones")

# Visualizaciones de peliculas
vis_por_peli <- colCounts(puntuacionmatriz) 

tabla_vis <- data.frame(movie = names(vis_por_peli),
                          views = vis_por_peli) # create dataframe of views
tabla_vis <- tabla_vis[order(tabla_vis$views, decreasing = TRUE), ] 

ggplot(tabla_vis[1:6, ], aes(x = movie, y = views)) +
  geom_bar(stat="identity") + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  scale_x_discrete(labels=subset(pelis2, pelis2$movieId == tabla_vis$movie)$title) +
  ggtitle("Numero de visualizaciones de las pelis mas vistas")

# Visualizacion de la matriz de puntuaciones 
image(puntuacionmatriz, main = "Heatmap de la matriz de puntuaciones")  # Demasiadas dimensiones, no se entiende
image(puntuacionmatriz[1:10, 1:15], main = "Heatmaps de las principales filas y columnas")
image(puntuacionmatriz[rowCounts(puntuacionmatriz) > quantile(rowCounts(puntuacionmatriz), 0.99),
                colCounts(puntuacionmatriz) > quantile(colCounts(puntuacionmatriz), 0.99)], 
      main = "Heatmap de los top usuarios y pelis")


# Normalizamos los datos
puntuacionmatriz_norm <- normalize(puntuacionmatriz)
image(puntuacionmatriz_norm[rowCounts(puntuacionmatriz_norm) > quantile(rowCounts(puntuacionmatriz_norm), 0.99),
                     colCounts(puntuacionmatriz_norm) > quantile(colCounts(puntuacionmatriz_norm), 0.99)], 
      main = "Heatmap de los top usuarios y pelis")

# User-Based Collaborative Filtering (UBCF) construccion del modelo de recomendacion 
recom<- Recommender(puntuacionmatriz_norm, 
                                 method = "UBCF", 
                                 param=list(method="Cosine",nn=30))

detalles_modelo <- getModel(recom)
detalles_modelo$data

recom_pred <- predict(recom, 
                 puntuacionmatriz[1], 
                 n=10) # Top 10 recomendaciones para el primer usuario 

recom_pred

recom_lista <- as(recom_pred,  "list") # Convertimos en lista el objeto predictivo


# Obtenemos recomendaciones
recom_result <- matrix(0,10)
for (i in 1:10){
  recom_result[i] <- as.character(subset(pelis, 
                                         pelis$movieId == as.integer(recom_lista[[1]][i]))$title)
}


# Evaluacion 
evaluacion <- evaluationScheme(puntuacionmatriz, 
                                      method="cross-validation", 
                                      k=5, given=3, 
                                      goodRating=5) # 5-fold cross validation dado un 3 de protocolo 
evaluacion_resultados <- evaluate(evaluacion, 
                               method="UBCF", 
                               n=c(1,3,5,10,15,20))
evaluacion_resultados2 <- getConfusionMatrix(evaluacion_resultados)[[1]]


