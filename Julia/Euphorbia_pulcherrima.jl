# La Euphorbia Pulcherrima mejor conocida como Nochebuena en Mexico es una planta que es muy particular de la época invernal
using Plots
using Random
function f(x)
    Random.seed!(123)
    Θ = range(0, stop = 2π, length = 100)
    r = abs.( 0.1 * randn(100) +cos.(x*Θ))
    return r
end
# En este ciclo se generan los valores dados por x y la función
y = []
for x = 2:4
    y =append!(y, f(x))
    println("(",x, ", ", f(x), ")")
end
# Creamos una visualización de la función
Θ = range(0, stop = 2π, length = 100)
plot(title="Euphorbia pulcherrima")
plot!(Θ, f(4), linetype = :line , linewidth = 0, proj = :polar, grid = false,showaxis = false,  leg=false, fillrange = 0,fillalpha = 1, fillcolor = :olive, size=(900,900))
plot!(Θ, f(3), linetype = :line , linewidth = 0,proj = :polar, fillrange = 0,fillalpha = 1, fillcolor = :firebrick3)
plot!(Θ, f(2), linetype = :line , linewidth = 0,proj = :polar, fillrange = 0,fillalpha = 1, fillcolor = :firebrick2)
# Guardamos la imagen generada del plot
savefig("Euphorbia_pulcherrima")
