`Data Science` > [`Programacion con R`]
## Inicio al modelaje de datos

### OBJETIVO
- Crear un algoritmo Random Forest

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion08/Reto-03`

#### DESARROLLO
Ahora mediremos la precision sobre la prediccion del cancer segun su clase
* Leemos el fichero (lo llamamos cancer) de la siguiente url: 'http://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/breast-cancer-wisconsin.data'
* Lo leemos como tabla e indicamos que no tiene cabeceras
* Renombramos las columnas con los siguientes nombres: 'codigo', 'clump_thickness', 'uniformity_of_cell_size', 'uniformity_of_cell_shape', 'marginal_adhesion', 'single_epithelial_cell_size', 'bare_nuclei', 'bland_chromatin', 'normal_nucleoli', 'mitoses', 'clase'
* Eliminamos la primera variable 
* Factorizamos la variable clase e indicamos que en el caso que sea de valor 4 es maligno (y le asignamos el valor 1), de lo contrario es benigno (y le asignamos el valor 0) (hint: funcion ifelse())   
* Creamos el random forest segun la clase
* Imprimimos los resultados y los evaluamos
