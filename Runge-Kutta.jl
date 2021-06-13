function rungekutta4(t0, tf, y0, f; N=100)
    t = range(t0, tf, length=N+1)
    h = t[2] - t[1]
    m = length(y0)
    w = zeros(m, N+1)
    w[:,1] = y0
    for k = 1:N
        θ₁ = f(t[k],w[:,k])
        θ₂ = f(t[k] + (h / 2), w[:,k] + (h * (θ₁ / 2)))
        θ₃ = f(t[k] + (h / 2), w[:,k] + (h * (θ₂ / 2)))
        θ₄ = f(t[k] + h, w[:,k] + (h * θ₃))
        w[:,k+1] = w[:,k] + (h * ((θ₁ + 2θ₂ + 2θ₃ + θ₄) / 6))
    end
    return t, w
end
