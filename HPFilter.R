#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
#					   #
# HP Filter: Hodrick-Prescott Filter       #
#	                                   #	
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
jHPfilter <- function(Y,lambda){
	#The Hodrick-Prescott Filter
	#Lambda = 6.25 annual, 129600 monthly, 1600 quarterly, ?? for daily
	T = length(Y)
	if(T < 5){
		stop("Number of observations is too small!")
	}
	A = matrix(0,T,T)
	A[1, 1:3] = c(1,-2,1)
	A[2, 1:4] = c(-2,5,-4,1)
	A[(T-1),(T-4+1):T] = c(1,-4,5,-2)
	A[T,(T-3+1):T] = c(1,-2,1)
	counter = 1
	for(i in 3:(T-3+1)){
		A[i,counter:(counter+5-1)] = c(1,-4,6,-4,1)
		counter = counter + 1
	}
	#print(A) visual check if matrix A is correct
	T = solve(diag(T)+lambda*A)%*%Y
	return(T)
}

jQuadraticFilter <- function(Y){
	#Quadratic Filter
	T = length(Y)
	X = matrix(0,T,2)
	X[,1] = seq(1:T)
	X[,2] = X[,1]^2
	temp = lm(Y~X)
	Trend = temp$coefficients[1] + temp$coefficients[2]*X[,1] + temp$coefficients[3]*X[,2]
	return(Trend)
}

#e.g. with data already in R
library(MASS)
Y = log(AirPassengers) #log of monthly air passengers
Trend = jHPfilter(Y,129600)
Trend2 = Y-Y+Trend
par(mfrow=c(3,2))
plot(Y,ylab="Log Passengers",type="l",main="Y = Monthly Air Passengers")
lines(Trend2,col="red")
plot(Trend2,type="l", main = "HP Trend",ylab = "HP Trend",col="red")
Cyclical = Y-Trend
plot(Cyclical, type="l", main = "Cyclical = Y minus HP Trend",col="blue")
Qtrend = jQuadraticFilter(Y)
Qtrend2 = Y-Y+Qtrend
plot(Qtrend2,type="l", main="Trend from Log-Quadratic" )
Cyclical2 = Y - Qtrend2
plot(Cyclical2,type="l",main= "Cyclical = Y minus Log-Quadratic Trend")


