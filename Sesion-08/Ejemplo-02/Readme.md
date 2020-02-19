`Data Science` > [`Programacion con R`]
## Inicio al modelaje de datos  

### OBJETIVO
- Algoritmo KNN (K Nearest Neighbors)

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion08/Ejemplo-02`

#### DESARROLLO

Este algoritmo nos ayuda a clasificar, a partir de la informacion que tenemos disponible (digamos que tenemos gatos y perros), dado un nuevo animal, cual es la categoria de animal que mas se le parece segun sus caracteristicas. Tendremos que graficar estas variables o atributos para ver como explican a que categoria corresponden. 

La distancia que nos explica esta similitud es la distancia Euclideana. Consiste en la media entre dos puntos de un plano. 
Los vecinos cercanos (nearest neigbors) los denominaremos "k". Entonces, si k es 5, tendremos cinco vecinos que analizar para determinar su categoria. 

Todas las variables tienen diferentes unidades de medida (como kg y cm). Para escribirlas dentro de una forma Euclideana tendremos que normalizarlas con la siguiente formula ```{r}(x-min(x))/(min(x) ??? max(x))```. De esta manera, todas las variables se representaran con valores entre 0 y 1. Asi ya podremos usar el box para incluir estos resultados. 

Este algoritmo funciona facilmente con variables numericas, aunque tambien se puedan usar variables categoricas, el resultado sera mas simple y preciso cuando solo consideremos variables de tipo numerico. 
Crearemos el test y training sets despues de haber normalizado la informacion. 
Vamos a hacer nuestra primera prueba con la data de "iris", ya disponible en R. 
```{r}
head(iris) 
```
Buscaremos un numero aleatroio (sample) que sea el 90% del total de filas (rows) del dataset. 
```{r} 
random <- sample(1:nrow(iris), 0.9 * nrow(iris)) 
```
Normalizaremos las variables como mencionamos anteriormente con la siguiente funcion: 
```{r}
normalizado <-function(x) {(x -min(x))/(max(x)-min(x))}
```
Ahora predeciremos las cuatro primeras columnas, que son nuestras variables, ya normalizandolas. 
```{r}
iris_normalizado <- as.data.frame(lapply(iris[,c(1,2,3,4)], normalizado))
summary(iris_normalizado)
```
Ya podemos crear el set de training (90% de las filas) y test (10% de las filas). 
```{r}
iris_training <- iris_normalizado[random,] 
iris_test <- iris_normalizado[-random,] 
```
Extraemos la quinta columna del training set (Species), ya que lo usaremos como clasificacion en la funcion knn. 
```{r}
iris_categoria_target <- iris[random,5]
iris_categoria_test <- iris[-random,5]
```

Usaremos el package "class" 
```{r}
install.packages("class")
library(class)
```

Corremos la funcion knn de predicion: 
```{r}
predic <- knn(iris_training,iris_test,cl=iris_categoria_target,k=13)
```

Creamos una confusion matrix (matriz de confusion) para ver la distribucion de la prediccion: 
```{r}
con_mat <- table(predic,iris_categoria_test)
```
 
Esta funcion divide las predicciones correctas entre el total de predicciones y nos indica que tan bueno es nuestro modelo de clasificacion.  
```{r}
precision <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}
precision(con_mat)
```
Salio muy bien nuestra prediccion! 
