using Plots
gr(size=(800,400))

include("Double-Spring-Simple.jl")

plot(t, D[1,:], leg=false)
plot!(t, D[2,:], leg=false)
