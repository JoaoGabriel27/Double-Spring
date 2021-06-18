using Plots
gr(size=(800,600))
include("Double-Spring-Damping.jl")

mola_y_C = 3.6
mola_y_A = 1.2
mola_n = 10
t = range(0, 1, length=400)
x = t
y = sin.(mola_n * 2π * t)
z = cos.(mola_n * 2π * t)
θ = π / 80
δ = 0.1
Δ = 1 - 2δ

@gif for i = 1:size(D,2)
    x1 = D[1,i]
    x2 = D[2,i]
    xa1 = 0.02
    xb1 = D[1,i] + 0.05
    xa2 = D[1,i] + 0.35
    xb2 = D[2,i] + 0.42
    yP = mola_y_C .+ mola_y_A * y
    yP = [mola_y_C; mola_y_C; yP; mola_y_C; mola_y_C]
    xP1 = xa1 .+ (δ .+ Δ * (x * cos(θ) + z * sin(θ) .- sin(θ))) * (xb1 - xa1)
    xP1 = [xa1; xa1 + (xb1 - xa1) * 0.1; xP1; xb1 - (xb1 - xa1) * 0.1; xb1]
    xP2 = xa2 .+ (δ .+ Δ * (x * cos(θ) + z * sin(θ) .- sin(θ))) * (xb2 - xa2)
    xP2 = [xa2; xa2 + (xb2 - xa2) * 0.1; xP2; xb2 - (xb2 - xa2) * 0.1; xb2]
    plot([-0.02;-0.02], [0.0;5.0], c=:black, lw=10, grid=false, leg=false, aspect_ratio=:equal)
    plot!([-5.0;10.0], [0.0;0.0], c=:black, lw=18, grid=false, leg=false, aspect_ratio=:equal)
    plot!(xP1, yP/13, c=:blue, lw=2) 
    plot!(xP2, yP/13, c=:red, lw=2) 
    scatter!([x1 + 0.2], [0.27], c=:blue, ms=18, m=:square)
    scatter!([x2 + 0.57], [0.27], c=:red, ms=18, m=:square)
    xlims!(-0.5,7.0)
    ylims!(0.0, 1.0)
end every 1
