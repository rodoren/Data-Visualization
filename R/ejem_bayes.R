#### Seleccion de probabilidades ----
p=seq(0,1,length=500)
#### Seleccion de parametros para la distribucion a priori ----
a=3.4
b=7.4
y=11
ny=16
#### Distribucion a Priori ----
priord<-dbeta(p,a,b)
#### Distribucion de verosimilitud ----
like<-dbeta(p,y+1,ny+1)
#### Distribucion a Posteriori ----
posteriord<-dbeta(p,a+y,b+ny)
#### Visualizacion de las distribuciones 
# la seleccion de colores se pueden encontrar en el siguiente enlace:
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
plot(p,posteriord,type="l", lty=2,lwd=3,ylab="Densidad",col="darkcyan", main= "Ejemplo: Estadistica Bayesiana Distribución Beta")
lines(p,like,lty=1,lwd=3,col="coral3")
lines(p,priord,lty=3,lwd=3,col="chartreuse4")
legend(0.7,4,c("Priori","verosimilitud","Posteriori"),lty=c(3,2,1),lwd=c(3,3,3),col=c("chartreuse4","coral3","darkcyan"),cex=0.7)
