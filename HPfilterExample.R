x = austres #quarterly number of australian residents from 1971q2 to 1993q2
i=1 #last 1q gone
j=4 #last 4q gone
k=8 #last 8q gone
l=12 #last 12q gone
hp1 = jHPfilter(log(x),1600)
hp2 = jHPfilter(log(x[1:(length(x)-i)]),1600)
hp3 = jHPfilter(log(x[1:(length(x)-j)]),1600)
hp4 = jHPfilter(log(x[1:(length(x)-k)]),1600)
hp5 = jHPfilter(log(x[1:(length(x)-l)]),1600)
c1 = (log(x) - hp1)
c2 = (log(x[1:(length(x)-i)]) - hp2)
c3 = (log(x[1:(length(x)-j)]) - hp3)
c4 = (log(x[1:(length(x)-k)]) - hp4)
c5 = (log(x[1:(length(x)-l)]) - hp5)
difference = (c1[1:(length(x)-i)]-c2)

library(scales)
par(mfrow=c(2,1))
plot(unclass(c1),col="black",type="l",yaxt="n",ylab="(%)",main="Cycle from HP (Full Sample: 1971q2 to 1993q2)",lwd=2,xlab="Number of Quarters")
axis(2,at=pretty(c1),lab=pretty(c1)*100,las=TRUE)
lines(unclass(c2),col="darkgreen",lty=1,yaxt="n",lwd=2)
lines(unclass(c3),col="red",lty=1,yaxt="n",lwd=2)
lines(unclass(c4),col="blue",lty=1,yaxt="n",lwd=2)
lines(unclass(c5),col="purple",lty=1,yaxt="n",lwd=2)
abline(h=0,col="black",lty=3)
legend("topleft",legend=c("Full Sample",paste("Without last",i,"q"),paste("Without last",j,"q"),paste("Without last",k,"q"),paste("Without last",l,"q")),col=c("black","darkgreen","red","blue","purple"),lty=1,box.lty=0,lwd=3)

plot(log(unclass(x)),type="l",col="black",lwd=2,lty=3,ylab="log # of Australian Residents",xlab="# of quarters",main="Australian Residents (logged) from 1971q2 to 1993q2")
lines(hp1,col="red",lwd=2)
legend("topleft",box.lty=0,legend=c("Actual Data","HP Trend"),col=c("black","red"),lty=c(1,2),lwd=2)

#plot(unclass(difference),type="p",yaxt="n",ylab="(%)")
#axis(2,at=pretty(difference),lab=pretty(difference)*100,las=TRUE)
