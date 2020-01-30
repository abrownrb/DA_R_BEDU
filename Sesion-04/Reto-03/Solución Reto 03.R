
## Densidad
qplot(Petal.Length, data=datos, geom='density',main="Densidad de Longitud de pétalo",
      xlab="Longitud de pétalo")
qplot(Petal.Length, data=datos, geom='density', color=Species, fill=Species, 
      main="Densidad de Longitud de pétalo por especie", 
      xlab="Longitud de pétalo")


# Sobrevivientes para cada sexo y clase.
a<-ggplot(df,aes(x=Survived,fill=Sex))+
  geom_histogram(position="dodge",binwidth=0.25)+theme_bw()

a <- a + facet_grid (~Pclass)
a