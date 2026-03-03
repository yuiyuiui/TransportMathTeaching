using Plots, LinearAlgebra

nx = 100
nt = 1000
α = 1.0
sumn = 10

grid = range(0, 1, length = nx)
time = range(0, 1, length = nt)

u = zeros(nx, nt)
u[1, 1]=1.0
for j = 2:nt
    for i = 1:nx
        x = grid[i]
        t = time[j]
        u[i, j] = 1-x
        for n = 1:sumn
            u[i, j] -= 2/(n*π) * sin(n*π*x) * exp(-α*(n*π)^2*t)
        end
    end
end

δ = sqrt.(α .* time)

anim = @animate for j = 1:nt
    plot(
        grid,
        u[:, j],
        xlabel = "x",
        ylabel = "u",
        title = "t = $(round(time[j], digits=3))",
        ylim = (-0.1, 1.1),
        legend = :topright,
        label = "u(x,t)",
    )
    vline!([δ[j]], label = "x = δ(t)", linestyle = :dash, color = :red)
end
gif(anim, joinpath(@__DIR__, "heat.gif"), fps = 10)
