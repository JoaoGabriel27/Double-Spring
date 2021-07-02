include("Runge-Kutta-Collisions.jl")

w₁ = 0.1  
F(t,S) = [S[3];                                                    #x₁' = v₁
          S[4];                                                    #x₂' = v₂
          -(k₁/m₁)*(S[1] - r₁) + (k₂/m₁)*(S[2] - S[1] - w₁ - r₂);  #v₁' = -(k₁/m₁)*(x₁ - r₁) + (k₂/m₁)*(x₂ - x₁ - w₁ - r₂)
          -(k₂/m₂)*(S[2] - S[1] - w₁ - r₂)]                        #v₂' = -(k₂/m₂)*(x₂ - x₁ - w₁ - r₂)
l₁ = x₀₁ - r₁            #Strech of the first spring
l₂ = x₀₂ - x₀₁ - w₁ - r₂ #Strech of the second spring
y₀ = [x₀₁; x₀₂; v₀₁; v₀₂]#Initial values for position 1, 2 and velocity 1, 2 respectively 
t0 = 0.0         #Initial and final time

t, D = rungekutta4col(t0, tf, y₀, m₁, m₂, F; N) #t is the time vector and D is a matrix with 4
                                                #lines and interation + 1 number of columns where
                                                #line 1 = positions block 1
                                                #line 2 = positions block 2
                                                #line 3 = velocities block 1
                                                #line 4 = velocities block 2 