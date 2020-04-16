######################################
########## Fundamentos de R ##########
##########    Sesi�n 01     ##########
##########  Ejercicio 04    ##########
######################################

# Para ver la ruta de d�nde estamos trabajando
getwd()

# Para bajar dos niveles del directorio de trabajo 
# utilizamos ../.. y para accesar a una nueva carpeta ponemos su nombre, Data
setwd('../../Data')

# Vemos la ruta cambiada
getwd()

# Para leer un archivo que tenemos en local
dataframe.traffic <- read.csv('Metro_Interstate_Traffic_Volume.csv')

# Podemos quedarnos solamente con las primeras 20 observaciones
dataframe.traffic.20 <- head(dataframe.traffic, 20)

# Podemos guardarla como csv en local
write.csv(dataframe.traffic.20, file = 'Short_DF_Example.csv')

# Podemos leer un archivo que esta en internet
dataframe.traffic.2 <- read.csv('https://raw.githubusercontent.com/analuisaortega/A2-Estadistica-con-R-2020/new-content/Data/Metro_Interstate_Traffic_Volume.csv', 
                                header =  TRUE)




