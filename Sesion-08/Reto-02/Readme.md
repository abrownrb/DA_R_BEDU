`Data Science` > [`Programacion con R`]
## Inicio al modelaje de datos

### OBJETIVO
- Crear un algoritmo knn

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion08/Reto-02`

#### DESARROLLO
Para nuestro modelo de clasificacion knn seguiremos los siguientes pasos: 
* Usaremos el dataset llamado "diamonds" ya disponible en R con el package ggplot2. 
* Lo guardaremos como data frame como "diamentes". 
* Crearemos un numero aleatorio con el 90% de las filas (llamado random)
* Crearemos una funcion de normalizacion (llamada normalizado)
* Normalizaremos los datos y los guardaremos como diamantes_normalizado
* Extraemos el training set y test set
* Extraemos la segunda columna (variable) y la guardamos como factor, ya que es una variable categorica en lugar de numerica (como diamantes_categoria_target). Haremos la misma conversion para test (diamantes_categoria_test)
* Correremos la funcion de prediccion con knn (gracias al package class)
* Creamos la confusion matrix
* Creamos la funcion de precision y la checamos 
