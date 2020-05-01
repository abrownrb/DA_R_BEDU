head(mpg)
mpg <-mpg


# Hacer una gráfica donde se muestre por cada marca (manufacturer)
# el número de autos y se coloreé según la clase (class)

ggplot(mpg, aes(x=manufacturer,fill=class)) + 
  geom_bar(position = "stack")

vis <- ggplot(mpg, aes(manufacturer))
vis + geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=90, vjust=0.6)) 
