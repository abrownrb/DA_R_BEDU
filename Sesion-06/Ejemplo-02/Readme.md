`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
- Aprender a leer data de una pagina web
- Transformar un vector numerico en serie de tiempo
- Estandarizar las fluctuaciones en series de tiempo sacando su logaritmo 
- Descomponer la estacionalidad de una serie de tiempo 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Ejemplo-02`

#### DESARROLLO


Importamos los datos de ventas de una tienda de la siguiente pagina web
```{r}
ventas <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
```

Comprobamos la estructura y vemos que es numerica, por lo que la transformaremos a serie de tiempo e indicaremos que tenga una frecuencia mensual iniciando en enero de 1987 
```{r}
str(ventas)
ventas <- ts(ventas, frequency=12, start=c(1987,1)) 
ventas
```

Creamos el grafico de esta serie de tiempo
```{r}
plot(ventas)
```

Podemos observar que este modelo aditivo no describe bien la serie de tiempo, pues la fluctuacion incrementa con el nivel de la serie de tiempo. Por ello, la transformaremos sacando su logaritmo
```{r}
logventas <- log(ventas)
plot(logventas)
```
Ahora las fluctuaciones son mas constantes a lo largo del tiempo y no dependen del nivel de la serie 

Vamos a descomponer la serie de tiempo en sus cuatro elementos 
```{r}
decventas <- decompose(logventas)
plot(decventas)
```
