# y' = 1-y²
# when y = 1+ϵ, y' = -2ϵ-ϵ² ≈ -2ϵ = -2(y-1)
# so y(t) ≈ 1+ϵe^(-2(t-t0)), so y is asymptoticly exponential to 1

using LinearAlgebra, Plots

L0 = 10
T = Float64
h = T(0.01)

mesh = collect(0:h:L0)

asymptotic_stable = ones(length(mesh))

fig_exp = plot(mesh, asymptotic_stable, label = "Asymptotic stable")


# compute_exp_coeffs: returns a0..aN for expansion y = 1 - sum_{n>=1} a_n e^{-n x}
# Options: either provide y0 (initial y(0)) or provide a2 explicitly.
function compute_exp_coeffs(
    N::Int;
    y0::Union{Nothing,Float64} = 0.0,
    a2::Union{Nothing,Float64} = nothing,
)
    @assert N ≥ 0
    a = zeros(Float64, N+1)   # a[1] -> a0, a[2] -> a1, ..., a[n+1] -> a_n

    # a0 = 1
    a[1] = 1.0

    # a1 = 0 (forced)
    if N ≥ 1
        a[2] = 0.0
    end

    # determine a2
    if N ≥ 2
        if a2 !== nothing
            a[3] = a2
        else
            # use y0 if provided (default y0=0.0)
            @assert y0 !== nothing
            C = atanh(y0)   # atanh in Base
            a[3] = 2*exp(-2*C)   # = 2*(1-y0)/(1+y0)
            # alternative direct formula: a[3] = 2*(1-y0)/(1+y0)
        end
    end

    # recurrence for n >= 3
    for n = 3:N
        s = 0.0
        for j = 1:(n-1)
            s += a[j+1]*a[n-j+1]   # a_j * a_{n-j}
        end
        a[n+1] = - s / (n - 2)
    end

    return a   # array length N+1: a0..aN
end

for order = 2:2:6
    sol_approx = compute_exp_coeffs(order)
    sol_exp =
        (x -> sum(sol_approx[i] * exp(-(i-1) * x) for i = 1:length(sol_approx))).(mesh)
    plot!(fig_exp, mesh, sol_exp, label = "Exponential approximation of order $order")
    println("Exponential approximation of order $order: ", round.(sol_approx, digits = 3))
end

display(fig_exp)

savefig(fig_exp, "exponential_approximation.svg")
