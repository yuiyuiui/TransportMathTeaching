1. Please solve the 3d heat equation with $u_0 = exp(-|x|^2), \Omega = \mathbb{R}^3$ and $f = 0$.

Hint: Heat kernel

2. Please learn operator spectrum theory and give a example that a linear operator does not have any eigenvalues.

3. Please solve the 3D heat equation on a unit ball $\Omega = \{ \mathbf{x} \in \mathbb{R}^3 : |\mathbf{x}| \le 1 \}$. Assume the temperature distribution is radially symmetric, $u = u(r, t)$, with no internal heat source ($f = 0$). The equation in spherical coordinates reduces to:$$\frac{\partial u}{\partial t} = \alpha \left( \frac{\partial^2 u}{\partial r^2} + \frac{2}{r} \frac{\partial u}{\partial r} \right)$$Boundary Condition: The surface of the ball is kept at zero temperature (Homogeneous Dirichlet BC):$$u(1, t) = 0$$Initial Condition: The initial temperature is given by:$$u(r, 0) = \frac{\sin(\pi r)}{r}$$

Hint: 1. Use the substitution $v(r, t) = r \cdot u(r, t)$ to transform the equation into a standard 1D heat equation for $v$.

2. Note that $v(0, t) = 0$ must hold for $u$ to remain finite at the origin.
