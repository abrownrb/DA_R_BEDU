 
 [`Estadística con R`](../Readme.md) > `Sesión 02: Manipulación de Datos` 

## Crear funciones

### OBJETIVO

Al final de el `Reto-01` serás capaz de:
- Crear una función
- Llamar a la función que creaste

### REQUISITOS

1. Completar el prework
2. R versión 3.6.2 o mayor
3. R Studio versión 1.2.5033 o mayor 
4. Git Bash

### INSTRUCCIONES DEL RETO

- Crea una función que reciba de argumento un nombre y devuelve 'Bienvenido -nombre', ponle a la función el nombre de `welcome` 
- Pruebala con tu nombre
- Pide ayuda con la función readline, es decir corre `?readline`
- Explica que hace el siguiente código:
```r
nombre <- readline(prompt = '¿Cuál es tu nombre?')
welcome(nombre)
```
- Modifica tu función `welcome` para que, además de nombre, pida edad. Ahora, debera regresar 'Bienvenido -nombre- con -edad- años'. Esta nueva función se debe llamar welcome.2