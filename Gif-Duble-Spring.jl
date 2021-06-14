using Plots
gr(size=(800,600))
include("Double-Spring.jl")

@gif for i = 1:size(D,2)
    x1 = D[1,i]
    x2 = D[2,i]
    plot([0.0;0.0], [0.0;5.0], c=:black, lw=10, grid=false, leg=false, aspect_ratio=:equal)
    plot!([-5.0;10.0], [0.0;0.0], c=:black, lw=10, grid=false, leg=false, aspect_ratio=:equal)
    plot!([0.0;x1], [0.14;0.14], c=:blue, lw=5) 
    plot!([x1;x2], [0.14;0.14], c=:red, lw=5) 
    scatter!([x1], [0.14], c=:blue, ms=10, m=:square)
    scatter!([x2], [0.14], c=:red, ms=10, m=:square)
    xlims!(-2.0,5.0)
    ylims!(0.0, 1.0)
end every 5
