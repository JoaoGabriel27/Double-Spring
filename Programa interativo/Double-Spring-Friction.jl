include("Runge-Kutta-Friction.jl")

g = 9.81 #Gravitational acceleration
w₁ = 0.1
F(t,S) = [S[3];                                                                       #x₁' = v₁
          S[4];                                                                       #x₂' = v₂
          -μ₁*g*sign(S[3]) - (k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);   #v₁' = -μ₁*g*sgn(v₁) - (k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂) 
          -μ₂*g*sign(S[4]) - (k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                         #v₂' = -μ₂*g*sgn(v₂) - (k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
                                                                                      #The sgn factor means that the friction force is always against the motion
l₁ = x₀₁ - r₁
l₂ = x₀₂ - x₀₁ - w₁ - r₂
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]
t0 = 0.0

t, D = rungekutta4fri(t0, tf, y₀, m₁, m₂, μ₁, μ₂, g, F; N)
