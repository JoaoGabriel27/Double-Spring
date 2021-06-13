include("Runge-Kutta.jl")

m₁, m₂ = 1.0, 2.0  #Mass of the first and second block
w₁ = 0.1           #Width of the first block
k₁, k₂ = 1.0, 2.0  #Spring constants of the first and second spring
r₁, r₂ = 1.0, 1.0  #Rest length of the first and second spring
F(t,S) = [S[3];                                                    #x₁' = v₁
          S[4];                                                    #x₂' = v₂
          -(k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);  #v₁' = -(k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂)
          -(k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                        #v₂' = -(k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
v₀₁, v₀₂ = -1.0, 1.0     #Initial velocity of the first and second block
x₀₁, x₀₂ = 0.1, 4.1      #Initial position of the first and second block
l₁ = x₀₁ - r₁            #Strech of the first spring
l₂ = x₀₂ - x₀₁ - w₁ - r₂ #Strech of the second spring
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]#Initial values for position 1, 2 and velocity 1, 2 respectively 
t0, tf = 0.0, 20         #Initial and final time

t, D = rungekutta4(t0, tf, y₀, F; N=500)
