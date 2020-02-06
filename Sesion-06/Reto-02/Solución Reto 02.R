
leche_mes$ano<-format(leche_mes$month, format = "%Y")
leche_mes$mes_num <- format(leche_mes$month, format = "%m")

ggplot(leche_mes, aes(x = mes_num, y = milk_prod_per_cow_kg, group = ano)) + 
  geom_line(aes(colour = ano)) + 
  theme_classic() 
