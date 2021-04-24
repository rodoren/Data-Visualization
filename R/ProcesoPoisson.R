##### Proceso de Poisson Compuesto con Distribucion Bernoulli #####
ppoisson_comp <- function(T, lambda){
  set.seed(50)
  t<-0
  N<-0
  x<-0
  while (max(t)<=T) {
    y<-rexp(1,lambda)
    t<-c(t, max(t)+y)
    N<-c(N,max(N)+1)
    x<-c(x,rbinom(1,1,1/2))
  }
  tk<-t[1:(length(t)-1)]
  Nk<-N[1:(length(N)-1)]
  xk<-cumsum(x[1:(length(N)-1)])
  return(list("Total_Eventos"=max(Nk), "Tiempos_Ocurrencia"=tk,
              "V.A." = x, "Tama�o_Salto"= xk, 
              "Grafica"= plot(stepfun(c(tk, T), c(0,xk,xk[length(xk)])),do.points=F, lwd = 2,
                              col= "red3", main= "Proceso de Poisson Compuesto, Yi dist Bernoulli",
                              xlab="t", ylab= "N(t)")))
}

ejer1 = ppoisson_comp(10, 5)

# Media muestral
media_muestral = sum(ejer1$V.A.)/ejer1$Total_Eventos
# Ya que p= 1/2 y la media muestral es 0.3962264 podemos observar que no son iguales
# pero tampoco están alejadas, aumentando el numero de simulaciones se acercará más 
# a la media teorica p.
# Varianza muestral 
varianza_muestral = sum((ejer1$V.A.-media_muestral)^2)/ejer1$Total_Eventos
# Nuevamente podemos observar la cercania entre los datos obtenidos para la varianza muestral
# (0.2451554) comparando con la varianza teorica p(1-p)=0.25 por lo que entre mayor sea el
# numero de simulaciones, más cercanos serán.

##### Media Muestral vs Media Teorica ######

X_ = runif(10, -1,1)
lambda = 2
U = -(1/lambda)*log(1-X_)

mediam_exp= sum(U)/length(X_)

# Sabemos que la media teorica de la distribucion exponencial es 1/lambda,
# ya que lambda=2 entonces la media teorica es 1/2, comparando con la media
# muestral Xbarra = 0.1876492 observamos la cercania entre ambos valores, 
# nuevamente, entre mas observaciones tengamos este valor se acercara mas a la 
# media teorica

###### Proceso de Poisson Compuesto con Distribucion Weibull ######

# Usando la funcion anteriormente creada tenemos 
ppoisson_comp_w <- function(T, lambda){
  set.seed(50)
  t<-0
  N<-0
  x<-0
  while (max(t)<=T) {
    y<-rexp(1,lambda)
    t<-c(t, max(t)+y)
    N<-c(N,max(N)+1)
    x<-c(x,rweibull(1, 10, 10))
  }
  tk<-t[1:(length(t)-1)]
  Nk<-N[1:(length(N)-1)]
  xk<-cumsum(x[1:(length(N)-1)])
  return(list("Total_Eventos"=max(Nk), "Tiempos_Ocurrencia"=tk,
              "V.A." = x, "Tamaño_Salto"= xk, 
              "Grafica"= plot(stepfun(c(tk, T), c(0,xk,xk[length(xk)])),do.points=F, lwd = 2,
                              col= "red3", main= "Proceso de Poisson Compuesto, Yi dist Weibull",
                              xlab="t", ylab= "N(t)")))
}
weib_pp = ppoisson_comp_w(1, 50)
weib_pp$Grafica$t[55]
weib_pp$Grafica$y[55]
weib_pp$V.A.
# Nuestro promedio teorico fue de 475.675384933436591 cuando t=1 entonces comparando 
# con nuestro promedio muestral 518.565378 podemos ver que ambos valores son muy
# cercanos

###### Proceso de Poisson Compuesto con Distribucion Log-normal ######

ppoisson_comp_lognorm <- function(T, lambda){
  set.seed(50)
  t<-0
  N<-0
  x<-0
  while (max(t)<=T) {
    y<-rexp(1,lambda)
    t<-c(t, max(t)+y)
    N<-c(N,max(N)+1)
    x<-c(x,rlnorm(1,3.5,0.005))
  }
  tk<-t[1:(length(t)-1)]
  Nk<-N[1:(length(N)-1)]
  xk<-cumsum(x[1:(length(N)-1)])
  return(list("Total_Eventos"=max(Nk), "Tiempos_Ocurrencia"=tk,
              "V.A." = x, "Tamaño_Salto"= xk, 
              "Grafica"= plot(stepfun(c(tk, T), c(0,xk,xk[length(xk)])),do.points=F, lwd = 2,
                              col= "red3", main= "Proceso de Poisson Compuesto, Yi Log-Normal",
                              xlab="t", ylab= "N(t)")))
}

lognor_pp = ppoisson_comp_lognorm(1, 14)
lognor_pp$Grafica$y[19]
lognor_pp$Grafica$t[19]

# Comparando la media teorica que nos arrojo un valor de 463.6221227 contra 
# nuestro media muestral cuando t=1 dando un resultado de 529.49459 podemos observar 
# que efectivamente los valores no estan muy alejados entre si



