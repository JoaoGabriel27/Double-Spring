include("Runge-Kutta.jl")

m₁, m₂ = 1.0, 2.0
w₁ = 0.1
k₁, k₂ = 1.0, 2.0
r₁, r₂ = 1.0, 1.0
F(t,S) = [S[3]; S[4]; -(k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂); -(k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]
v₀₁, v₀₂ = -1.0, 1.0 
x₀₁, x₀₂ = 0.1, 4.1
l₁ = x₀₁ - r₁
l₂ = x₀₂ - x₀₁ - w₁ - r₂
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]
t0, tf = 0.0, 20

t, D = rungekutta4(t0, tf, y₀, F; N=500)
