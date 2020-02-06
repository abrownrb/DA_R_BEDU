reyes <- scan('https://robjhyndman.com/tsdldata/misc/kings.dat',skip=3)
str(reyes)
reyes <- ts(reyes)
plot(reyes)
