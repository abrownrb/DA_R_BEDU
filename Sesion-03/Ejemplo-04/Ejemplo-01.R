#Condición simple.

variable <- 8
if (variable > 40){
print("La variable es superior a 40")
} else {
print ("La variable no es superior a 40")
}

ifelse(variable>40, "La variable es superior a 40", "La variable no es superior a 40")

#Condición con OR o AND

A <- 8
B <- 17
C <- 10
D <- 10
if (A > B || C == D){ # probar con AND (&)
print("TRUE")
} else {
print ("FALSE")
}

ifelse(A > B || C == D, "TRUE", "FALSE")
