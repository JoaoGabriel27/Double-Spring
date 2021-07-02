using Plots
gr(size=(800,400))

plot(t, D[1,:], leg=false)
plot!(t, D[2,:], leg=false)
