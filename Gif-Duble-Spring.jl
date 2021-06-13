using Plots
gr(size=(800,600))
include("Double-Spring.jl")

@gif for i = 1:size(D,2)
    x1 = D[1,i]
    x2 = D[2,i]
    scatter([0.0], [0.0], c=:black, ms=3, leg=false, aspect_ratio=:equal)
    plot!([0.0;x1], [0.0;0.0], c=:blue) 
    plot!([x1;x2], [0.0;0.0], c=:red) 
    scatter!([x1], [0.0], c=:blue, ms=5)
    scatter!([x2], [0.0], c=:red, ms=5)
    xlims!(-2.0,6.0)
    ylims!(-1, 1)
end every 5
