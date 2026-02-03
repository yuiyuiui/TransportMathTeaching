using LinearAlgebra, Plots

L0 = 5
T = Float64
h = T(0.01)

mesh = collect(0:h:L0)
m = length(mesh)

asymptotic_stable = ones(length(mesh))
asymptotic_unstable = - ones(length(mesh))

initial_value = collect(-2:1.5:5)

fig_stable = plot(mesh, asymptotic_unstable, label = "Asymptotic unstable")
plot!(fig_stable, mesh, asymptotic_stable, label = "Asymptotic stable")

for inv in initial_value
    sol_initial = tanh.(mesh .+ inv)
    plot!(fig_stable, mesh, sol_initial, label = "Initial value $(round(inv, digits=3))")
end

y0 = 5.0
res = zero(mesh)
res[1] = y0
dy = 1 - res[1]^2
for k = 2:length(mesh)
    res[k] = res[k-1] + dy * h
    dy = 1 - res[k]^2
end
plot!(fig_stable, mesh, res, label = "Initial value 2.0")

savefig(fig_stable, "stable_region.svg")

y = -1.0001
res = zero(mesh)
res[1] = y
dy = 1 - res[1]^2
for k = 2:length(mesh)
    res[k] = res[k-1] + dy * h
    dy = 1 - res[k]^2
end
plot!(fig_stable, mesh, res, label = "Initial value -1.0001")

display(fig_stable)

savefig(fig_stable, "unstable_region.svg")
