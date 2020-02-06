`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
- Aprender a leer data de una pagina web
- Transformar un vector numerico en serie de tiempo
- Graficar una serie de tiempo 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Ejemplo-01`

#### DESARROLLO


Importamos los datos de la edad en la que murieron los reyes de Inglaterra de la siguiente pagina web
```{r}
reyes <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat")

```

Si observamos la informacion vemos que nos interesa filtrar los tres primeros registros que no contienen data, por lo que sustituiremos la variable con esta orden 
```{r}
reyes <- scan("https://robjhyndman.com/tsdldata/misc/kings.dat",skip=3)
```

Comprobamos la estructura y vemos que es numerica, por lo que la transformaremos a serie de tiempo
```{r}
str(reyes)
reyes <- ts(reyes)
```

Creamos un plot de la serie de tiempo
```{r}
plot(reyes)
```