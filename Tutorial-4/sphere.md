# 1. Problem Description: 
Consider a sphere with radius $R$, whose initial temperature distribution is uniform, and the boundary is subjected to a constant ambient temperature. The physical equation is as follows:

Control equation: $$\frac{\partial T}{\partial t} = \alpha_0 \Delta T, \quad |\mathbf{x}-\mathbf{x}_0| \le R, \quad \mathbf{x} \in \mathbb{R}^3$$

Boundary conditions (BC): $$T(|\mathbf{x}-\mathbf{x}_0|=R, t \ge 0) = T_\infty$$

Initial conditions (IC): $$T(|\mathbf{x}-\mathbf{x}_0| < R, t=0) = T_{in}$$

# 2. Standard form:

$$u(\mathbf{x}, t) = \frac{T(\frac{\mathbf{x-x_0}}{R}, t) - T_{in}}{T_\infty - T_{in}}$$

**Substitute $u$ into the control equation to derive:**

Let the dimensionless coordinate $\boldsymbol{\xi} = \frac{\mathbf{x}-\mathbf{x}_0}{R}$, then $|\boldsymbol{\xi}| \le 1$ corresponds to $|\mathbf{x}-\mathbf{x}_0| \le R$. By solving the above equation, we get:
$$T(\boldsymbol{\xi}, t) = T_{in} + (T_\infty - T_{in})\, u(\boldsymbol{\xi}, t)$$

Substitute $T$ into the original control equation $\frac{\partial T}{\partial t} = \alpha_0 \Delta T$ (where $\Delta$ is the Laplace operator with respect to the original space variable $\mathbf{x}$):

**(1) Time derivative:**
$$\frac{\partial T}{\partial t} = \frac{\partial}{\partial t}\big[T_{in} + (T_\infty - T_{in})\, u\big] = (T_\infty - T_{in})\, \frac{\partial u}{\partial t}$$

**(2) Laplace term (chain rule):** Since $\boldsymbol{\xi} = \frac{\mathbf{x}-\mathbf{x}_0}{R}$, we have $\frac{\partial \xi_i}{\partial x_j} = \frac{\delta_{ij}}{R}$, thus
$$\frac{\partial}{\partial x_i} = \frac{\partial \xi_j}{\partial x_i}\frac{\partial}{\partial \xi_j} = \frac{1}{R}\frac{\partial}{\partial \xi_i}$$
$$\frac{\partial^2}{\partial x_i^2} = \frac{1}{R^2}\frac{\partial^2}{\partial \xi_i^2}$$
Therefore $\Delta_{\mathbf{x}} = \sum_i \frac{\partial^2}{\partial x_i^2} = \frac{1}{R^2}\sum_i \frac{\partial^2}{\partial \xi_i^2} = \frac{1}{R^2}\Delta_{\boldsymbol{\xi}}$, thus
$$\alpha_0 \Delta T = \alpha_0 \Delta_{\mathbf{x}} T = \alpha_0 \cdot \frac{1}{R^2}\, \Delta_{\boldsymbol{\xi}} T = \frac{\alpha_0}{R^2}\, (T_\infty - T_{in})\, \Delta_{\boldsymbol{\xi}} u = \frac{\alpha_0}{R^2}\, (T_\infty - T_{in})\, \Delta u$$

**(3) Substitute into PDE:**
$$(T_\infty - T_{in})\, \frac{\partial u}{\partial t} = \frac{\alpha_0}{R^2}\, (T_\infty - T_{in})\, \Delta u$$
Divide both sides by $(T_\infty - T_{in}) \neq 0$, we get the standard form:

Control equation: $$\frac{\partial u}{\partial t} = \frac{\alpha_0}{R^2} \Delta u, ~|\mathbf{x}|\leq1, t\geq0$$

Define $\alpha = \frac{\alpha_0}{R^2}$.

BC: $$u(|\mathbf{x}|=1, t) = 1$$

IC: $$u(|\mathbf{x}|<1, t=0) = 0$$



# 3. Step 2: Symmetry judgment and coordinate conversion

### 3.1 Step 2.1: 
Radial function judgment. Since: Operator symmetry: The Laplace operator $\Delta$ is invariant under rotation transformation. Geometric symmetry: The definition domain (sphere) is rotationally symmetric. Condition symmetry: The initial condition $T_{in}$ and boundary condition $T_\infty$ are both constants, not changing with the angle $\theta, \phi$. Therefore, the temperature field $u$ does not exist in the angular gradient, that is, $u$ is only a function of the radial distance $r$ and time $t: v(r,t) = u(|\mathbf{x}|=r, t)$.

### 3.2 Step 2.2: Laplace term in spherical coordinates.

The full Laplace operator in spherical coordinates $(r, \theta, \phi)$ is:

$$\Delta f = \frac{1}{r^2}\frac{\partial}{\partial r}\!\left(r^2 \frac{\partial f}{\partial r}\right) + \frac{1}{r^2 \sin\theta}\frac{\partial}{\partial \theta}\!\left(\sin\theta \frac{\partial f}{\partial \theta}\right) + \frac{1}{r^2 \sin^2\theta}\frac{\partial^2 f}{\partial \phi^2}$$

Since $v = v(r,t)$ is a radial function (does not depend on $\theta, \phi$), the angular terms vanish:

$$\frac{\partial v}{\partial \theta} = 0, \quad \frac{\partial v}{\partial \phi} = 0$$

So only the radial term survives:

$$\Delta v = \frac{1}{r^2}\frac{\partial}{\partial r}\!\left(r^2 \frac{\partial v}{\partial r}\right)$$

Expand the derivative using the product rule:

$$\frac{\partial}{\partial r}\!\left(r^2 \frac{\partial v}{\partial r}\right) = 2r\frac{\partial v}{\partial r} + r^2\frac{\partial^2 v}{\partial r^2}$$

Divide by $r^2$:

$$\Delta v = \frac{1}{r^2}\left(2r\frac{\partial v}{\partial r} + r^2\frac{\partial^2 v}{\partial r^2}\right) = \frac{2}{r}\frac{\partial v}{\partial r} + \frac{\partial^2 v}{\partial r^2}$$

Therefore:

$$\boxed{\Delta v = \frac{\partial^2 v}{\partial r^2} + \frac{2}{r} \frac{\partial v}{\partial r}}$$

Therefore, the radial PDE in the dimensionless unit ball $0 \le r \le 1$ is:
$$\frac{\partial v}{\partial t} = \alpha \left( \frac{\partial^2 v}{\partial r^2} + \frac{2}{r} \frac{\partial v}{\partial r} \right)$$

# 4. Step 3: Separation of variables method

The radial equation with its conditions:

$$\frac{\partial v}{\partial t} = \alpha \left( \frac{\partial^2 v}{\partial r^2} + \frac{2}{r} \frac{\partial v}{\partial r} \right), \quad 0 < r < 1$$

- BC: $v(1, t) = 1$
- IC: $v(r, 0) = 0, \quad 0 \leq r < 1$


---

### 4.1 Core substitution: eliminate the $\frac{2}{r}v_r$ term

The $\frac{2}{r}\frac{\partial v}{\partial r}$ term prevents direct separation of variables. Introduce:

$$\psi(r, t) = r \cdot v(r, t)$$

Compute each piece. Since $v = \psi / r$:

$$\frac{\partial v}{\partial r} = \frac{\psi_r}{r} - \frac{\psi}{r^2}$$

$$\frac{\partial^2 v}{\partial r^2} = \frac{\psi_{rr}}{r} - \frac{2\psi_r}{r^2} + \frac{2\psi}{r^3}$$

Sum them:

$$\frac{\partial^2 v}{\partial r^2} + \frac{2}{r}\frac{\partial v}{\partial r} = \frac{\psi_{rr}}{r} - \frac{2\psi_r}{r^2} + \frac{2\psi}{r^3} + \frac{2\psi_r}{r^2} - \frac{2\psi}{r^3} = \frac{\psi_{rr}}{r}$$

The middle terms cancel exactly! Together with $v_t = \psi_t / r$, the PDE becomes:

$$\frac{\psi_t}{r} = \alpha \frac{\psi_{rr}}{r}$$

$$\boxed{\psi_t = \alpha \, \psi_{rr}}$$

This is the standard 1D heat equation.

Updated conditions for $\psi$:

- **BC1** : $\psi(r=0, t) = 0 \cdot v(0, t) = 0$
- **BC2** : $\psi(1, t) = 1$
- **IC**: $\psi(r, 0) = r \cdot v(r, 0) = 0$

---

According to conclusion in the last tutorial,

$$
\psi(r,t)
=r-\sum_{n=1}^{\infty}
\frac{2}{n\pi}
\sin(n\pi (1-r))
e^{-\alpha (n\pi)^2 t}
\\
= r + \sum_{n=1}^{\infty} \frac{2}{n\pi} (-1)^n \sin(n\pi r) e^{-\alpha (n\pi)^2 t}
$$

$$\Longrightarrow v(r,t) = \frac{\psi(r,t)}{r} = 1 + \frac{1}{r}\sum_{n=1}^{\infty} \frac{2}{n\pi} (-1)^n \sin(n\pi r) e^{-\alpha (n\pi)^2 t}$$

# 5. Final analytical solution. 
$$T(\mathbf{x},t) = T_{in} + (T_\infty - T_{in})v(\frac{|\mathbf{x-x_0}|}{R},t) = T_{in} + (T_\infty - T_{in})(1 + \frac{R}{|\mathbf{x-x_0}|}\sum_{n=1}^{\infty} \frac{2}{n\pi} (-1)^n \sin(n\pi \frac{|\mathbf{x-x_0}|}{R}) e^{-\frac{\alpha_0 (n\pi)^2 t}{R^2}})$$