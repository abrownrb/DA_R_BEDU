head(mtcars)
scatter.smooth(x=mtcars$wt, y=mtcars$mpg, main="Peso y Millas por Galon")  
cor(mtcars$wt, mtcars$mpg) 
modlin <- lm(wt ~ mpg, data=mtcars)  
print(modlin)
summary(modlin)

