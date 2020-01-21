`Data Science` > [`Programacion con R`]

### OBJETIVO
- Operaciones posibles desde la calculadora de R
- Ver los componentes de un package

#### REQUISITOS
1. Contar con R studio
1. Usar la carpeta de trabajo `Sesion-01/Postwork`

#### DESARROLLO

Para seguir practicando con ejercicios sobre la calculadora de R, podemos usar el siguiente link. Aqui tenemos ejercicios online, asi como la definicion de la sintaxis para hacer cualquier tipo de operacion. Rpubs nos servira para reafirmar los conocimientos aprendidos durante el curso, asi que lo guardaremos para futuras dudas:
<http://rpubs.com/rparra/438560> 


En cuanto a los packages de R, sabemos que vamos a estar usando habitualmente los mismos. No obstante, para seguir aprendiendo o solucionando dudas de aquellos que no conocemos, podemos inspeccionar las funciones de los packages de R con estructuras parecidas a las ordenes que damos a la terminal de nuestra computadora. Para ver todos los objetos que contiene el paquete usaremos la funcion ls (list files): 
```{r}
ls("package:ggplot2")
```

De igual forma, para conocer todas las funciones disponibles en el package, usaremos la funcion lsf.str: 
```{r}
lsf.str("package:ggplot2")
```
