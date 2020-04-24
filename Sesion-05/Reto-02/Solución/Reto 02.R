# 1. Lee el archivo Metro_Interstate_Traffic_Volume.csv
# 2. Ve la estructura del dataframe
# 3. ¿Cuáles son los niveles de la columna weather_main?
# 4. Reordena los niveles alfabéticamente
# 5. Agrega una columna llamada weather_main_ordered al dataframe,
# donde los niveles estén ordenados



Metro_Interstate_Traffic_Volume <- read.csv('https://raw.githubusercontent.com/analuisaortega/A2-Estadistica-con-R-2020/new-content/Data/Metro_Interstate_Traffic_Volume.csv', 
                                            header =  TRUE)
str(Metro_Interstate_Traffic_Volume)

levels(Metro_Interstate_Traffic_Volume$weather_main)

ordered.levels <- c("Clear", "Clouds", "Drizzle","Fog","Haze","Mist","Rain","Smoke","Snow","Squall","Thunderstorm")

Metro_Interstate_Traffic_Volume$weather_main_ordered <- factor(x = Metro_Interstate_Traffic_Volume$weather_main, 
                                                               levels = ordered.levels, ordered = TRUE)

str(Metro_Interstate_Traffic_Volume)
