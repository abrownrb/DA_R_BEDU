
library(ggplot2)
head(mpg)
mpg<-mpg
vis <- ggplot(mpg, aes(manufacturer))
vis + geom_bar(aes(fill=class))

vis + geom_bar(aes(fill=class), width = 0.3) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.9)) 

grafica <- ggplot(mpg,aes(manufacturer, fill = class)) + geom_bar()
