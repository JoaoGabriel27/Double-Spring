function rungekutta4col(t0, tf, y0, m₁, m₂, f; N=100)
    t = range(t0, tf, length=N+1)
    h = t[2] - t[1]
    m = length(y0)
    w = zeros(m, N+1)
    w[:,1] = y0
    for k = 1:N
        if (w[2,k] - w[1,k] < 0) 
            w[3,k], w[4,k] = ((m₁ - m₂)*w[3,k] + 2*m₂*w[4,k])/(m₁ + m₂), ((m₂ - m₁)*w[4,k] + 2*m₁*w[3,k])/(m₁ + m₂)
        end
        if (w[1,k] < 0)
            w[3,k] = -w[3,k]
        end
        θ₁ = f(t[k],w[:,k])
        θ₂ = f(t[k] + (h / 2), w[:,k] + (h * (θ₁ / 2)))
        θ₃ = f(t[k] + (h / 2), w[:,k] + (h * (θ₂ / 2)))
        θ₄ = f(t[k] + h, w[:,k] + (h * θ₃))
        w[:,k+1] = w[:,k] + (h * ((θ₁ + 2θ₂ + 2θ₃ + θ₄) / 6))
    end
    return t, w
end
