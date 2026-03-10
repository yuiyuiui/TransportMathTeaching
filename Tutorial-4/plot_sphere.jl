# Headless mode, avoid displaying related errors
ENV["GKSwstype"] = "100"  # 文件输出模式
using Plots
gr()

# v(r,t) = 1 + (1/r) * Σ (2/(nπ))(-1)^n sin(nπr) exp(-α(nπ)²t)
# At r=0, use the limit: lim_{r→0} sin(nπr)/r = nπ
function v(r, t, α, N=80)
    if r < 1e-8  # The limit when r≈0
        s = 0.0
        for n = 1:N
            s += 2 * (-1)^n * exp(-α * (n * π)^2 * t)
        end
        return 1.0 + s
    else
        s = 0.0
        for n = 1:N
            s += (2 / (n * π)) * (-1)^n * sin(n * π * r) * exp(-α * (n * π)^2 * t)
        end
        return 1.0 + s / r
    end
end

α = 1.0
nr = 80
nθ = 60
N_terms = 80

# r ∈ (0.01, 1] to avoid numerical problems at r=0, use 0.01 as the inner boundary
r_grid = range(0.01, 1.0, length=nr)
θ_grid = range(0, 2π, length=nθ)

# Time range: from 0 to 0.4 (the main stage of heat diffusion)
n_frames = 60
t_max = 0.4
t_values = range(0.001, t_max, length=n_frames)

anim = @animate for (k, t) in enumerate(t_values)
    # Build 3D rotating surface: x=r*cos(θ), y=r*sin(θ), z=v(r,t)
    X = [ri * cos(θ) for ri in r_grid, θ in θ_grid]
    Y = [ri * sin(θ) for ri in r_grid, θ in θ_grid]
    Z = [v(ri, t, α, N_terms) for ri in r_grid, θ in θ_grid]

    surface(
        X, Y, Z,
        xlabel = "x",
        ylabel = "y",
        zlabel = "v(r,t)",
        title = "Sphere heat conduction: v(r,t) evolves with time,\n t = $(round(t, digits=4))",
        color = :thermal,
        camera = (30, 25),
        legend = false,
        zlim = (0, 1.1),
    )
end

gif(anim, joinpath(@__DIR__, "sphere_heat_3d.gif"), fps = 12)
println("GIF saved to: ", joinpath(@__DIR__, "sphere_heat_3d.gif"))
