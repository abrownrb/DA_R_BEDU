
library(ggplot2)
head(mpg)
mpg<-mpg
vis <- ggplot(mpg, aes(manufacturer))
vis + geom_bar(aes(fill=class), width = 0.5) + 
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) 
