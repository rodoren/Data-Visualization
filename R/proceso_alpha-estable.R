#### Simulacion de proceso de levy estable ----
proc_estable <- function(T,N,alpha,epsilon, sigma, mu){
  # set.seed(100)
  t0<-0
  dt<-T/N
  tk<-seq(t0,T,dt)
  X<-0
  if(alpha!=1){
    S<-(1+(epsilon^2)*((tan(pi*alpha)/2))^(2*alpha))
    B<-(atan(epsilon*tan((pi*alpha)/2)))/alpha
    U<-runif(N,-pi/2,pi/2)
    Y<-rexp(N)
    X<-c(X,dt^(1/alpha)*S*((sin(alpha*(U+B)))/Y)^((1-alpha)/alpha))
    PX<-cumsum(X)
    Xk<-sigma*PX+mu*tk
  }
  if(alpha==1){
    U<-runif(N,-pi/2,pi/2)
    Y<-rexp(N)
    X<-c(X,dt^(1/alpha)*(2/pi)*(((pi/2)+epsilon*U)*tan(U)-epsilon*log((Y*cos(U))/((pi/2)+epsilon*U))))
    PX<-cumsum(X)
    Xk<-sigma*PX+(2/pi)*epsilon*sigma*log(sigma)+mu*tk
  }
  plot(tk,Xk,type = "l",lwd=3,col= "black",main = "Proceso de Levy Estable", xlab = "t", ylab = "S(t)")
}
#### Simulacion y visualizacion proceso de Levy Estable
proc_estable(10,100,.5,.1,1,0)

