include("Runge-Kutta-Friction.jl")

m₁, m₂ = 1.0, 1.0
μ₁, μ₂ = 0.01, 0.01 #Coeficients of friction of the first and second block
g = 9.81 #Gravitational acceleration
w₁ = 0.1
k₁, k₂ = 0.4, 1.8
r₁, r₂ = 1.0, 1.0
F(t,S) = [S[3];                                                                       #x₁' = v₁
          S[4];                                                                       #x₂' = v₂
          -μ₁*g*sign(S[3]) - (k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);   #v₁' = -μ₁*g*sgn(v₁) - (k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂) 
          -μ₂*g*sign(S[4]) - (k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                         #v₂' = -μ₂*g*sgn(v₂) - (k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
                                                                                      #The sgn factor means that the friction force is always against the motion
v₀₁, v₀₂ = 1.0, -1.0 
x₀₁, x₀₂ = 3.0, 6.6
l₁ = x₀₁ - r₁
l₂ = x₀₂ - x₀₁ - w₁ - r₂
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]
t0, tf = 0.0, 100

t, D = rungekutta4fri(t0, tf, y₀, m₁, m₂, μ₁, μ₂, g, F)
