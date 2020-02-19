`Data Science` > [`Programacion con R`]
## Inicio al modelaje de datos

### OBJETIVO
- Algoritmo Random Forest

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion08/Ejemplo-03`

#### DESARROLLO
El modelo random forest se basa en los arboles de decision; estos se definen como modelos para clasificar un caso. Para cada arbol, un numero aleatorio de casos se va a generar de todas las posibles situaciones y, a su vez, un nodo de posibles desenlaces para cada uno de ellos. 
Vamos a crear un modelo de clasificacion de vinos. 
Leemos la data del link 'http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data' e importamos los packages que usaremos (ggplot2 y randomForest)

```{r}
library("randomForest")
library(ggplot2)
vinos <- 'http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data'
```

Reconfiguraremos los datos para leerlos como tabla e indicar que no incluye cabeceras: 
```{r}
vinos <- read.table(file=url(vinos), header=FALSE, sep=",")
```

Ahora crearemos los nombres de las columnas: 
```{r}
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
```

Crearemos los nombres de las columnas que hemos definido a nuestra base de vinos y convertiremos a factor la clase, ya que es la variable segun la que tomaremos decisiones. 
```{r}
names(vinos) <- columnas
vinos$clase <- as.factor(vinos$clase)
```

Creamos una muestra aleatoria de 31 y creamos muestra y muestra_2, nuestras dos bases aleatorias de igual tamano. 
```{r}
set.seed(31)
muestra <- sort(sample(x = 1:nrow(vinos), replace = FALSE, size = nrow(vinos)/2))
muestra_2 <- setdiff(1:nrow(vinos), muestra)
```

Con ellas, extraeremos el test y training set: 
```{r}
test <- vinos[muestra, ]
train <- vinos[muestra_2, ]
```

Aplicamos el modelo de random forest para la variable clase: 
```{r}
randfor <- randomForest(clase ~ ., data=train, importance=TRUE, do.trace=100)
```
Ahora mediremos la importancia para cada una de las clases y lo graficaremos: 
```{r}
clase1_importance <- data.frame(feature=names(randfor$importance[,1]), importance=randfor$importance[,1])
ggplot(clase1_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
clase2_importance <- data.frame(feature=names(randfor$importance[,2]), importance=randfor$importance[,2])
ggplot(clase2_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
clase3_importance <- data.frame(feature=names(randfor$importance[,3]), importance=randfor$importance[,3])
ggplot(clase3_importance, aes(x=feature, y=importance)) + geom_bar(stat="identity")
```

Mediante un boxplot, veremos el impacto del color en cada clase y el del alcohol
```{r}
boxplot(vinos$color ~ vinos$clase, main="Color segun la clase")
boxplot(vinos$alcohol ~ vinos$clase, main="Alcohol segun la clase")
```

Finalmente, veremos la conexi??n entre ambas variables (alcohol y color) segun cada clase: 
```{r}
ggplot(vinos, aes(x=alcohol, y=color, colour=clase)) + geom_point()
```





