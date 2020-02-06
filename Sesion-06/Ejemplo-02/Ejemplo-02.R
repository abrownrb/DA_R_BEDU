ventas <- scan("http://robjhyndman.com/tsdldata/data/fancy.dat")
str(ventas)
ventas <- ts(ventas, frequency=12, start=c(1987,1)) 
ventas
plot(ventas)
logventas <- log(ventas)
plot(logventas)
decventas <- decompose(logventas)
plot(decventas)
