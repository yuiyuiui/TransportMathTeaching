using Plots
using LinearAlgebra

# ==========================================
# 1. 物理域与网格离散
# ==========================================
N = 100
L = 2π
dx = L / N
x = range(0, L-dx, length=N)

# 显式前向Euler稳定性条件: dt <= 0.5 * dx^2
dt = 0.4 * dx^2
T_end = 0.1  # 设定略微超过理论崩溃点 (0.137) 的总演化时间
steps = Int(ceil(T_end / dt))

# ==========================================
# 2. 空间差分离散算子构造
# ==========================================
M_cd = zeros(N, N)
M_fd = zeros(N, N)

for i in 1:N
    im1 = mod1(i-1, N)
    ip1 = mod1(i+1, N)
    ip2 = mod1(i+2, N)
    
    # 算子 M_cd: 2阶中心差分
    M_cd[i, im1] =  1.0
    M_cd[i, i]   = -2.0
    M_cd[i, ip1] =  1.0
    
    # 算子 M_fd: 2阶前向差分
    M_fd[i, i]   =  1.0
    M_fd[i, ip1] = -2.0
    M_fd[i, ip2] =  1.0
end

M_cd ./= dx^2
M_fd ./= dx^2

# ==========================================
# 3. 初始条件与时间演化
# ==========================================
u_cd = sin.(x)
u_fd = sin.(x)

t_vec = Float64[]
err_cd = Float64[]
err_fd = Float64[]

for n in 1:steps
    t = n * dt
    u_exact = exp(-t) .* sin.(x)
    
    # 时间推进: u^{n+1} = (I + dt * M) * u^n
    u_cd .= u_cd .+ dt .* (M_cd * u_cd)
    u_fd .= u_fd .+ dt .* (M_fd * u_fd)
    
    push!(t_vec, t)
    push!(err_cd, norm(u_cd .- u_exact, Inf))
    push!(err_fd, norm(u_fd .- u_exact, Inf))
    
    # 溢出保护
    if last(err_fd) > 1e20
        println("M_fd 发生灾难性溢出，于 t = $(round(t, digits=4)) 终止计算。")
        break
    end
end

# ==========================================
# 4. 可视化与理论基准比对
# ==========================================
# 计算理论崩溃时间基准 (基于谱分析与双精度机器误差 1e-16 -> 1e20)
λ_max = 4.0 / dx^2
G_max = 1.0 + dt * λ_max
n_blowup = 36.0 / log10(G_max)
t_theoretical = n_blowup * dt

plt = plot(
    t_vec, err_cd, 
    label="M_cd: Central Difference (Stable)", 
    yscale=:log10, 
    linewidth=2.5, 
    color=:blue, 
    xlabel="Time (t)", 
    ylabel="L_∞ Error (Log Scale)",
    legend=:topleft, 
    title="Numerical Stability: Operator Spectrum vs Float Noise",
    grid=true,
    minorgrid=true,
    framestyle=:box
)

plot!(
    plt, t_vec, err_fd, 
    label="M_fd: Forward Difference (Blow-up)", 
    linewidth=2.5, 
    color=:red
)

# 绘制解析推导的理论崩溃线
vline!(
    plt, [t_theoretical], 
    label="Theoretical Blow-up (\$t \\approx $(round(t_theoretical, digits=3)))", 
    linewidth=2, 
    color=:black, 
    linestyle=:dash
)

savefig(plt, "Tutorial-Error_Evolution_Final.svg")