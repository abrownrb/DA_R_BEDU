library('ggplot2')
library('tseries')

leche_mes_ts <- ts(leche_mes$milk_prod_per_cow_kg, start = 1962, end = 1975, freq = 12)  
leche_mes_stl <- stl(leche_mes_ts, s.window = "period")
plot(leche_mes_ts) 
plot(leche_mes_stl) 


