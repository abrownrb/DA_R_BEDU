`Data Science` > [`Programacion con R`]
## Inicio al modelaje de datos

### OBJETIVO
- Practicar nuestra primera regresion lineal  

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion08/Ejemplo-01`

#### DESARROLLO

Usaremos la base de "cars" ya disponible en R. Mediante un scatterplot podremos ver la relacion entre distancia y velocidad. La funcion para crearlo es scatter.smooth(x,y) y podemos anadirle un titulo al grafico con la funcion, main="" 
```{r}
head(cars)
scatter.smooth(x=cars$speed, y=cars$dist, main="Distancia y Velocidad")
```

Luego buscaremos la correlacion entre ambas variables: 
```{r} 
cor(cars$speed, cars$dist) 
```
Observamos que hay una correlacion muy positiva (80%)

Vamos a construir un modelo lineal con la funcion lm(); hay que indicarle la data de origen y las variables que queremos comparar. 
```{r}
modlin <- lm(dist ~ speed, data=cars)  
print(modlin)
```
Los resultados de coeficientes podrian ser leidos como: distancia = 17.579 + 3.932 velocidad

Para sacar un diagnostico de este modelo linear, aplicaremos la funcion summary: 
```{r}
summary(modlin)
```
El objetivo es ver la significancia estadistica. Un modelo lineas es significativo solo si ambos p-values son inferiores al nivel de significancia preestablecido de 0.05. 

