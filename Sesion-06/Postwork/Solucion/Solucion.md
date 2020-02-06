Objetivo: 
Profundizar en el concepto de series de tiempo. 

Instrucciones:

Responde las siguientes preguntas:

¿Qué es una serie de tiempo?

Por serie de tiempo nos referimos a datos estadísticos que se recopilan, observan o registran
en intervalos de tiempo regulares (diario, semanal, semestral, anual, entre otros). 

¿Cómo puedo crear una serie de tiempo en R?

La función ts () convertirá un vector numérico en un objeto de serie temporal R. El formato es ts (vector, inicio =, final =, frecuencia =) donde inicio y final son los tiempos de la primera y última observación y la frecuencia es el número de observaciones por unidad de tiempo (1 = anual, 4 = trimestral, 12 = mensual, etc.).

¿Qué es una serie de tiempo estacionaria?

Una serie temporal se define como una colección de observaciones de una variable
recogidas secuencialmente en el tiempo. Estas observaciones se suelen recoger en instantes de tiempo equiespaciados

¿Cómo puedo conocer la tendencia, estacionalidad y error de una serie de tiempo?

El decompose() y el forecast :: stl () divide las series temporales en componentes de estacionalidad, tendencia y error.

¿Qué son los lags?

Cuando la base de tiempo se desplaza por un número determinado de períodos, se crea un retraso de series de tiempo. Los retrasos de una serie de tiempo a menudo se utilizan como variables explicativas para modelar la serie de tiempo real en sí.

¿Cómo puedo crear lags de una serie de tiempo?

laggedTS <- lag(tsData, 3) # desplazado 3 períodos antes. Use `-3` para #avanzar 3 puntos hacia adelante.

¿Qué es la autocorrelación y la autocorrelación parcial?

Muestra si los estados anteriores (observaciones rezagadas) de la serie temporal influyen en el estado actual. En el gráfico de autocorrelación, si la autocorrelación cruza la línea azul discontinua, significa que el retraso específico se correlaciona significativamente con las series actuales.
