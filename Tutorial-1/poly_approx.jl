using LinearAlgebra, Plots

L0 = 6
T = Float64
h = T(0.01)

mesh = collect(0:h:L0)
m = length(mesh)

sol_real = tanh.(mesh)

fig_poly = plot(mesh, sol_real, label = "Real solution")

asymptotic_stable = ones(length(mesh))

plot!(fig_poly, mesh, asymptotic_stable, label = "Asymptotic stable")

function solve_coeffs(N)
    a = zeros(Float64, N+1)  # a[1]=a₀
    a[2] = 1.0               # a₁ = 1

    for k = 1:(N-1)
        s = 0.0
        for j = 1:(k-1)
            s += a[j+1] * a[k-j+1]
        end
        a[k+2] = -s / (k+1)
    end

    return a
end

for order = 1:5
    sol_approx = solve_coeffs(order)
    sol_poly = (x -> sum(sol_approx[i] * x^(i-1) for i = 1:length(sol_approx))).(mesh)
    plot!(
        fig_poly,
        mesh[1:(m÷5)],
        sol_poly[1:(m÷5)],
        label = "Polynomial approximation of order $order",
    )
    println("Polynomial approximation of order $order: ", round.(sol_approx, digits = 3))
end

savefig(fig_poly, "polynomial_approximation.svg")
