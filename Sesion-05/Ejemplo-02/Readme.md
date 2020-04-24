[`Estadística con R`](../Readme.md) > `Sesión 02: Manipulación de Datos`

## Columnas tipo factor en un dataframe

### OBJETIVO

Al final de el `Ejemplo-02` serás capaz de:
- Identificar las columnas que son tipo factor
- Ordenar las columnas tipo factor

### REQUISITOS

1. Completar el prework
2. R versión 3.6.2 o mayor
3. R Studio versión 1.2.5033 o mayor 
4. Git Bash
5. Completar el `Ejemplo-01`
6. Completar el `Reto-01`  

### TEORÍA

Al utilizar la función `str()` para ver la estructura de nuestro dataframe, podemos ver el tipo de columna que es, según el tipo de dato que alberga. Conocemos casi todos, menos el tipo **Factor**. Este aparece cuándo la columna tiene valores categóricos, es decir, que la columna toma uno de distintas posibles categorías. 

Para poder ver los distintos valores de una columna, podemos utilizar `unique()` o `levels()`. 

```r
getwd()
setwd('../../Data')

df.dataframe = read.csv('Metro_Interstate_Traffic_Volume.csv')

str(df.dataframe)

# Veamos los distintos niveles de la columna holiday
unique(df.dataframe$holiday)
levels(df.dataframe$holiday)
```

En este caso, los niveles de la columna factor no están ordenados. Quiere decir que no es capaz de distinguir cuál festividad ocurre primero. Para ordenar una columna podemos hacerlo manualmente de la siguiente manera.

```r
# Ordenar niveles
niveles.orden <- c('Christmas Day','Columbus Day','Independence Day','Labor Day','Martin Luther King Jr Day',
                       'Memorial Day','New Years Day','None','State Fair', 'Thanksgiving Day', 'Veterans Day',
                       'Washingtons Birthday')

# Agregamos columna con los niveles ordenados
df.dataframe$holiday_orden <- factor(x = df.dataframe$holiday, levels = niveles.orden, ordered = TRUE)

# Veamos que cambió en nuestro dataframe
str(df.dataframe)

unique(df.dataframe$holiday_orden)
```