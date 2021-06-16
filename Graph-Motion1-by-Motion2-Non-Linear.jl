using Plots
gr(size=(800,400))

include("Double-Spring-Non-Linear.jl")

plot(D[1,:], D[2,:], leg=false)
