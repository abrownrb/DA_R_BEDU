library(ggplot2)
diamantes <- data.frame(diamonds)
random <- sample(1:nrow(diamantes),0.9 * nrow(diamantes))
normalizado <-function(x) { (x -min(x))/(max(x)-min(x))}
diamantes_normalizado <- as.data.frame(lapply(diamantes[,c(1,5,6,7,8,9,10)], normalizado))
diamantes_trainining <- diamantes_normalizado[random,]
diamantes_test <- diamantes_normalizado[-random,] 
diamantes_categoria_target <- as.factor(diamantes[random,2])
diamantes_categoria_test <- as.factor(diamantes[-random,2])
library(class)
predic <- knn(diamantes_trainining,diamantes_test,cl=diamantes_categoria_target,k=20)
con_mat <- table(predic,diamantes_categoria_test)
precision <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
precision(con_mat)
