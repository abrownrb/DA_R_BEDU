`Data Science` > [`Programacion con R`]
## Manipulación de objetos

### OBJETIVO
- Aprenderas a cargar un dataset
- Aprenderas a mostrar un resumen estadistico del dataset
- Aprenderas a manipular objetos del data set

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion02/Ejemplo-01`

#### DESARROLLO


1. Cargamos el csv de **mtcars**  


2. Usaremos el comando **str** para desplegar la estructura del dataset e identificar los valores **int** que podrían ser variables de tipo lógico, desplegaremos el valor de los objetos con **class**
	
		str(mtcars)
		class(mtcars$vs)
	
 	![](img/3.png)
 	
3. Cambiaremos las variables con valores 1 y 0, por un tipo de dato logico con el siguiente método **as.logical(dataset$variable)**

	
		mtcars$vs = as.logical(mtcars$vs)
		mtcars$am = as.logical(mtcars$am)
		class(mtcars$vs)
		class(mtcars$am)
	
	![](img/4.png)
	
4. Usaremos el comando **Summary** para mostrar un resumen estadistico del DataSet	
		
		summary(mtcars)
		
	
	![](img/5.png)
	
5. Como podemos observar la variable **wt** se encuentra en libras, por lo cual transformaremos su valor a Kilos
	
		wt <- (mtcars$wt*1000/2.204623)
		wt
	
	![](img/6.png)
	
	
6. Se podrá observar que los valores en el dataset no han cambiado, por lo cual tendremos que usar el **transform()** para realizar adecuadamente el cambio de valor.

		mtcars.new <- transform(mtcars, wt = wt * 1000 / 2.204623)
		summary(mtcars)
	
	![](img/6.png)

