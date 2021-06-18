include("Runge-Kutta-Collisions.jl")

m₁, m₂ = 1.0, 1.0
δ₁, δ₂ = 0.1, 0.2 #Damping constants of the first and second block
w₁ = 0.1
k₁, k₂ = 0.4, 1.8
r₁, r₂ = 1.0, 1.0
F(t,S) = [S[3];                                                                     #x₁' = v₁
          S[4];                                                                     #x₂' = v₂
          -(δ₁/m₁)*(S[3]) - (k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);  #v₁' = -(δ₁/m₁)*(x₁) - (k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂)
          -(δ₂/m₂)*(S[4]) - (k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                        #v₂' = -(δ₂/m₂)*(x₂) - (k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
v₀₁, v₀₂ = 1.0, 1.0 
x₀₁, x₀₂ = 2.0, 2.6
l₁ = x₀₁ - r₁
l₂ = x₀₂ - x₀₁ - w₁ - r₂
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]
t0, tf = 0.0, 60

t, D = rungekutta4col(t0, tf, y₀ , m₁, m₂, F)
