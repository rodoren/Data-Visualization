#### Funcion F_(a,b) ####
# Simulacion de una variable aleatoria F_(a,b) haciendo una transformacion de 
# variables aleatorias a variable aleatoria

F_ab = function(a,b,n){
  # Muestra aleatoria iid de X de tamaño n
  X = rchisq(n,a)
  # Muestra aleatoria iid de Y de tamaño n
  Y = rchisq(n,b)
  # Por definicion de transformaciones de variables aleatorias, F_ tiene
  # distribucion F de Fisher con a y b grados de libertad.
  F_ = (X*b)/(Y*a)
  return(F_)
}

#### Explicacion ####
# Dentro de la funcion, se definen las muestras aleatorias independientes e 
# identicamente distribuidas como Ji cuadrada de tamaño n, con a y b grados de
# libertad para X e Y respectivamente. Realizando la tranformacion de vector 
# aleatorio a variable aleatoria, tenemos que la funcion F se distribuye F de 
# Fisher con a y b grados de libertad.

#### Ejemplo ####
FF = F_ab(10, 15, 1000)
#### Histograma de la distribucion ####

hist(FF, freq = FALSE, ylim = c(0,0.8), main = "F-Fisher")

# Densidad de la distribucion simulada
lines(density(FF),lwd = 2, lty = 1,col = "red3")

# Funcion de distribucion F-Fisher predeterminada de R
curve(df(x, 10, 15),lwd = 2, lty = 2,add = TRUE, col = "gray0")

legend(x = "topright",         # Posicion
       legend = c("Densidad", "F-Fisher"), # Textos de la leyenda
       lty = c(1, 2),          # Tipo de lineas
       col = c("red3", "gray0"),          # Colores de las lineas
       lwd = 2)                # Ancho de las lineas
