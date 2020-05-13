
head(iris) 
random <- sample(1:nrow(iris), 0.95 * nrow(iris)) 
normalizado <-function(x) {(x -min(x))/(max(x)-min(x))}
iris_normalizado <- as.data.frame(lapply(iris[,c(1,2,3,4)], normalizado))
iris_training <- iris_normalizado[random,] 
iris_test <- iris_normalizado[-random,] 
iris_categoria_target <- iris[random,5]
iris_categoria_test <- iris[-random,5]
library(class)
predic <- knn(iris_training,iris_test,cl=iris_categoria_target,k=15)
con_mat <- table(predic,iris_categoria_test)
precision <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
precision(con_mat)

# diamonds
# la columna 2 es la categoría
# jugar con k y con tamaño test-train


