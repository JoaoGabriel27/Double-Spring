using Plots
gr(size=(800,400))

@gif for i in 1:1
    plot(t, D[1,:], leg=false)
    plot!(t, D[2,:], leg=false)
end

print("Você quer salvar esse grafico, veja clicando no arquivo acima? (0=não,1=sim) \n")
u = readline()
if u == "1"
    print("Deseja salvar com qual nome? (coloque o tipo de arquivo, exemplo, .png) \n")
    nome = readline()
    savefig(nome)
end
