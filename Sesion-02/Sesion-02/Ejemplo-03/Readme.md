[`Estadística con R`](../Readme.md) > `Sesión 01: Fundamentos de R` 

## Funciones útiles para DataFrames

### OBJETIVO

Al final de el `Ejercicio-03` serás capaz de:
- Utilizar funciones precargadas de R
- Entender como comparar valores
- Seleccionar renglones y columnas utilizando condiciones
- Ver estructura y estadísticos básicos de un dataframe

### REQUISITOS

1. Completar el prework
2. R versión 3.6.2 o mayor
3. R Studio versión 1.2.5033 o mayor 
4. Git Bash
5. Completar el `Ejemplo-02` 
6. Completar el `Reto-02`

### TEORÍA: FUNCIONES ÚTILES PARA DATAFRAMES

#### PARTE 1. FUNCIONES PRECARGADAS EN R
En el `Ejemplo-02` vimos que en R hay algunos dataframes que están precargados. De la misma manera, en R hay funciones que ya están precargadas listas para usarlas con nuestros datos. Algunas de las más importantes tienen que ver con estadísticos básicos de las columnas de los dataframes, por ejemplo poder encontrar el mínimo de una columna.

```r
min(iris$Sepal.Length)
min(iris$Sepal.Length[1:5])
mean(iris$Sepal.Length)
max(iris$Sepal.Length)
median(iris$Sepal.Length)
```

#### PARTE 2. CONDICIONALES
En R, vimos que para asignar a una nueva variable utilizabamos `<-`. ¿Qué pasa si utilizaramos `=` para esto? Nada. Para R, estos dos maneras son válidas para asignar el valor a una nueva variable. ¿Qué pasa si utilizamos `==` para la misma tarea? No funciona. En R, `==` es una manera de preguntarle a la computadora: '¿lo que este en el lado derecho es exactamente igual a lo que está en el lado izquierdo?'. A esta pregunta, solo se puede contestar con un **Si** o **No**. Lo mismo hace R, nos devuelve, en caso de que se cumpla la condición(**Si**) el booleano **TRUE** y en caso de que no se cumpla la condición(**No**) el booleano será **FALSE**. Existen otros operadores para poder compara elementos entre si:
```r
10 > 10
10 < 10
10 <= 10
10 >= 10
10 != 10
10 == 10
```

#### PARTE 3. CONDICIONES EN UN DATAFRAME
Una manera muy útil de utilizar estas condiciones, es cuándo queremos comparar o filtrar los valores de alguna columna de un dataframe.

```r
# Podemos comparar los valores de las columnas de un dataframe
iris$Sepal.Width > 2

# Podemos usar la comparación para filtrar un dataframe
iris[iris$Sepal.Width > 2, ]

# Podemos utilizar alguna función para elegir el valor sobre el que se va a comparar
iris[iris$Sepal.Width > mean(iris$Sepal.Width), ]

# Podemos comparar y elegir cuáles columnas mostrar
iris[iris$Sepal.Width > 2,1:3]
```

#### PARTE 4. ESTRUCTURA Y RESUMEN DE DATAFRAME

Existen dos funciones muy imporantes al empezar a trabajar con un dataframe, `summary()` y `str()` las cuáles nos dan las estadísticas básicas e información general y relevante de un dataframe.

```r
# Para ver la estructura de un dataframe
str(iris)

# Para ver los estadísticos básicos de las columnas de un dataframe
summary(iris)
```
