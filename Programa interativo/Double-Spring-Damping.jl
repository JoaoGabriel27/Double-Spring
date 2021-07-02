include("Runge-Kutta-Collisions.jl")

w₁ = 0.1
F(t,S) = [S[3];                                                                                             #x₁' = v₁
          S[4];                                                                                             #x₂' = v₂
          -(δ₁/m₁)*(S[3]) + (δ₂/m₁)*(S[4] - S[3]) - (k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);  #v₁' = -(δ₁/m₁)*(v₁) + (δ₂/m₁)*(v₂ - v₁) - (k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂)
          -(δ₂/m₂)*(S[4] - S[3]) - (k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                                         #v₂' = -(δ₂/m₂)*(v₂ - v₁) - (k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
l₁ = x₀₁ - r₁
l₂ = x₀₂ - x₀₁ - w₁ - r₂
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]
t0 = 0.0

t, D = rungekutta4col(t0, tf, y₀ , m₁, m₂, F; N)
