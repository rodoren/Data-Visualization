using Plots
# Creamos la funcion que genera la trayectoria de un movimiento Browniano en una dimension
function wiener(T,N, γ,σ)
    t0 = 0    
    w0 = 0
    dt = T/N
    t = [t0:dt:T;]
    dw = []
    dw = [dw; w0; sqrt.(dt)*randn(N)]
    B = cumsum(dw)
    W = sqrt.(σ)*B + γ*t
#     return plot!(t,W, size = (1000,700), title= "Brownian Motion")
    return W
end
# esta funcion genera las coordenas de las trayectorias para asi mapear las trayectorias del 
# movimiento browniano en tres dimensiones
function wiener3D(T,N, γ,σ)
    x = wiener(T,N, γ,σ)
    y = wiener(T,N, γ,σ)
    z = wiener(T,N, γ,σ) 
    return plot!(x,y,z, size = (900,500), grid = false, showaxis = false, leg=false, widen =false)
end

# este codigo genera la trayectoria de 20 movimientos brownianos unidimensionales
t = 0:100
plot()
for i in range(0,20,length = 20)
    β = wiener(100, 100, 1,600)
    plot!(t, β ,title= "20 Brownian Motions", size = (900,500), grid = false, showaxis = false, leg=false, widen =false)
end
# mostramos los resultados
plot!()
# # guardamos los resultados
savefig("Brownian_Motion")

# generamos la trayectoria de un movimiento browniano
plot(title= "Brownian Motion in Three Dimensions", color = :blue)
wiener3D(1000, 1000, 1, 600)
savefig("Brownian_Motion_3D")

# este codigo genera 20 trayectorias brownianas tridimensionales
plot()
for i in range(0,10,length= 10)
    wiener3D(1000, 1000, 1, 600)
end
plot!(title= "10 Brownian Motions in Three Dimensions")
savefig("Brownian_Motions_3D")