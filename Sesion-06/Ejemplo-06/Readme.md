`Data Science` > [`Programacion con R`]
## Series de tiempo

### OBJETIVO
Organizacion completa de un problema de series de tiempo: 
1. Examinar los datos
   Hacer un plor y examinar su comportamiento e irregularidades
   Limpiar los outliers y valores nulos si es necesario - funcion tsclean()
   Sacar el logaritmo a las series para ayudar a estabilizar la gran tendencia de crecimiento

2. Descomponer los datos 
   La serie tiene tendencias o estacionariedad? 
   Usar decompose() para examinar y eliminar componentes de las series

3. Estacionalidad
   Es la serie estacionaria? 
   Usa adf.test(), graficos de ACF y PACF para determinar el orden de la diferenciacion si es necesario

4. Autocorrelaciones y eleccion de modelo 
   Elige el orden de ARIMA segun sus graficos de ACF y PACF

5. Haz el fit del modelo ARIMA

6. Evaluacion
   Busca residuos, que no deberian tener patrones y deberian estar normalmente distribuidos 
   Calculamos el forecast o prediccion 
   

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion06/Ejemplo-03`

#### DESARROLLO


Importamos los packages necesarios y la data. En este caso tenemos informacion de un servicio de bike sharing. El fichero se llama dia.

```{r}
library('ggplot2')
library('forecast')
library('tseries')
setwd("~/Desktop/Bedu - Introducci??n R/A2-Programacion-con-R/Sesion-06/Ejemplo-03")
dia <- read.csv("dia.csv")
hora <- read.csv("hora.csv")
str(dia)
```

Observamos que dteday es caracter y tenemos que convertirlo a ts. Creamos un plot con las bicicletas usadas por dia y mes  
```{r}
dia$dteday <- as.Date(dia$dteday)

ggplot(dia, aes(dteday, cnt)) + geom_line() + scale_x_date('Mes')  + ylab("Bicis usadas diariamente") + xlab("")
```
Observamos que en invierno disminuye el uso e incrementa en verano 

Vamos a buscar el volumen de outliers y borrarlos de nuestro dataset con la funcion tsclean()
```{r}
recuento <- ts(dia[, c('cnt')])
dia$outliers <- tsclean(recuento)
ggplot() + geom_line(data = dia, aes(x = dteday, y = outliers)) + ylab('Recuento de bicis sin outliers')
```
Todavia observamos una alta volatilidad. Sacaremos la MA (moving average) semanal y mensual de la data para convertir la serie en algo mas estable y, consecuentemente, predecible. 

```{r}
dia$recuento_ma_sem = ma(dia$outliers, order=7) 
dia$recuento_ma_mes = ma(dia$outliers, order=30)

ggplot() +
  geom_line(data = dia, aes(x = dteday, y = outliers, colour = "Cuenta")) +
  geom_line(data = dia, aes(x = dteday, y = recuento_ma_sem,   colour = "MA semanal"))  +
  geom_line(data = dia, aes(x = dteday, y = recuento_ma_mes, colour = "MA mensual"))  +
  ylab('Recuento Bicis')
```
Vamos a descomponer la serie para ver que elementes contiene y entender mejor como se comporta. 

```{r}
cuenta_ma <- ts(na.omit(dia$recuento_ma_sem), frequency=30)
desc <- decompose(cuenta_ma, s.window="periodic")
desestac <- seasadj(desc)
plot(desestac)
```

Ahora ya podemos checar la estacionalidad para hacer un modelo ARIMA. Eso significa que su media, varianza y covarianza son independientes al tiempo. El augmented Dickey-Fuller (ADF) test nos ayuda a checar la estacionalidad. La hipotesis nula asume que es no estacionario. Todo parece ser que no es estacionario por el gran volumen de fluctuaciones que observamos a simple vista, pero hay que realizar el test. 
```{r} 
adf.test(cuenta_ma, alternative = "stationary")
```
Tendremos que usar diferenciadores para eliminar sus ciclos y tendencias. 
Usaremos un grafico de autocorrelacion, este nos ayuda a ver si un modelo es estacionario y tambien a elegir el orden de los parametros para ARIMA. Vemos en el grafico ACF que hay autocorrelacion con muchos de los lags; sin embargo, cuando vemos el PACF nos damos cuenta que se debe a la correlacion con etapas iniciales, observando los picos del uno y el siete. 
```{r} 
Acf(cuenta_ma, main='')
Pacf(cuenta_ma, main='')
```

Veamos ahora el resultado del Dickey-Fuller test con la data diferenciada y vemos que se rechaza la hipotesis nula de no estacionalidad.
```{r} 
cuenta_dif = diff(desestac, differences = 1)
plot(cuenta_dif)
adf.test(cuenta_dif, alternative = "stationary")
```
Ahora, comprobar los picos en particulares lags de la serie diferenciada nos puede ayudar en la eleccion de p y q de nuestro modelo.
```{r} 
Acf(cuenta_dif, main='ACF de serie diferenciada')
Pacf(cuenta_dif, main='PACF de serie diferenciada')
```
Hay auto correlaciones significativas en los lags 1 y 2, y correlaciones parciales en el 1 y el 7. Eso nos muestra que queremos testear los modelos con componentes de orden 1, 2 o 7. Que suceda en el lag 7 puede significar un patron, como por ejemplo un determinado dia de la semana. 

Vamos a encontrar el fit con el modelo. La funcion auto.arima() nos genera el optimo (p,d,q). Para encontrar la calidad de los modelos hay multiples opciones; de las mas usadas son: Akaide information criteria (AIC) y Bayesian information criteria (BIC). Queremos minimizar AIC y BIC, pues nos dan informacion de cuanta informacion se perderia si usamos dicho modelo. 
```{r} 
auto.arima(desestac, seasonal=FALSE)
```
Usando el modelo nuestro ARIMA seria Y = ar1 Y_{t-1} - ma1 e_{t-1} + E donde E es el error y la serie esta diferenciada en 1.

Vamos a testear nuestro modelo. Deberiamos esperar una autocorrelacion no significativa; la funcion tsdisplay() nos ayuda a plasmarlo
```{r} 
fit2 <- arima(desestac, order=c(1,1,7))
fit2
tsdisplay(residuals(fit2), lag.max=15, main='Estacionalidad en los residuos')
```
Vamos a hacer un forecast
```{r} 
fcast <- forecast(fit2, h=30)
plot(fcast)
```