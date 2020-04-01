`Data Science` > [`Programacion con R`]
## Paquetes  

### OBJETIVO
- Instalar un paquete.
- Pedir ayuda sobre su contenido y funcionalidad.

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion01/Ejemplo-02`

#### DESARROLLO

Instalaremos un paquete de mi eleccion, en este caso, ggplot2, que me permitiran hacer ejercicios de visualizacion.

Esta opcion solo la tengo que realizar una vez y ya queda almacenado en la memoria de nuestro RStudio

```{r}
install.packages("ggplot2")
```

Cargando el paquete para poder usarlo. Esta operacion tendra que repetirla cada vez que reinicie el programa y quiera usar el paquete

```{r}
library("ggplot2")
```

Solicito ayuda / informacion de la descripcion y uso de este paquete

```{r}
?ggplot2
```

