
library("randomForest")
library(ggplot2)
vinos <- 'http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data'
vinos <- read.table(file=url(vinos), header=FALSE, sep=",")
columnas <- c('clase',
            'alcohol',
            'malic_acid',
            'ash',
            'ash_alcalinidad',
            'magnesio',
            'total_phenols',
            'flavanoids',
            'nonflavanoid_phenols',
            'proanthocyanins',
            'color',
            'hue',
            'od280_od315',
            'proline')
names(vinos) <- columnas
vinos$clase <- as.factor(vinos$clase)
set.seed(31)
muestra <- sort(sample(x = 1:nrow(vinos), replace = FALSE, size = nrow(vinos)/2))
muestra_2 <- setdiff(1:nrow(vinos), muestra)
test <- vinos[muestra, ]
train <- vinos[muestra_2, ]
randfor <- randomForest(clase ~ ., data=train, importance=TRUE, do.trace=100)
clase1_importance <- data.frame(feature=names(randfor$importance[,1]), importance=randfor$importance[,1])
ggplot(clase1_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
clase2_importance <- data.frame(feature=names(randfor$importance[,2]), importance=randfor$importance[,2])
ggplot(clase2_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
clase3_importance <- data.frame(feature=names(randfor$importance[,3]), importance=randfor$importance[,3])
ggplot(clase3_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
boxplot(vinos$color ~ vinos$clase, main="Color segun la clase")
boxplot(vinos$alcohol ~ vinos$clase, main="Alcohol segun la clase")
ggplot(vinos, aes(x=alcohol, y=color, colour=clase)) + geom_point()





