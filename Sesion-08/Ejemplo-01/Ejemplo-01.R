install.packages('stats')
library(stats)
head(cars)
scatter.smooth(x=cars$speed, y=cars$dist, main="Distancia y Velocidad")  
cor(cars$speed, cars$dist) 
modlin <- lm(dist ~ speed, data=cars)  
print(modlin)
summary(modlin)
plot(modlin)
# 3.932  * speed -17.579  = dist

# con mtcars usar lm para wt - y en términos de mpg - x