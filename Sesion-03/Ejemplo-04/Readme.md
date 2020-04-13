`Data Science` > [`Programacion con R`]
## Funciones, condiciones y loops

### OBJETIVO
- Aprender a hacer un loop con IF ELSE 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion03/Ejemplo-01`

#### DESARROLLO

Vamos a crear una un funcion para validar si nuestra variable es superior a 40 
```{r}
variable <- 8
if (variable > 40){
  print("La variable es superior a 40")
} else {
  print ("La variable no es superior a 40")
}
```

Alternativamente, podemos usar la funcion ifelse, que nos ayudara a plantear el resultado a obtener si se cumple la condicion, y a continuacion el resultado a obtener si no se cumple la misma 
```{r}
ifelse(variable>40, "La variable es superior a 40", "La variable no es superior a 40")
``` 