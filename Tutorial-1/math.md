https://github.com/yuiyuiui/TransportMathTeaching

# Basic Methods for Analyzing Ordinary Differential Equations

This article uses the Riccati equation

$$
y' = 1 - y^2
$$

as an example to introduce several basic methods for analyzing ordinary differential equations. The exact solution of this equation is $y(x) = \tanh(x + C)$, where $C$ is determined by the initial condition.

---

## 1. Polynomial Approximation (Taylor Series Expansion)

Near $x = 0$, the solution can be expanded as a power series:

$$
y(x) = \sum_{k=0}^{\infty} a_k x^k
$$

**Derivation of Recurrence Relation:**

Substituting $y = \sum_k a_k x^k$ into $y' = 1 - y^2$ and comparing coefficients of $x^k$:

- $y' = \sum_{k \geq 1} k a_k x^{k-1}$
- $y^2 = \left(\sum_k a_k x^k\right)^2 = \sum_n \left(\sum_{j=0}^{n} a_j a_{n-j}\right) x^n$

Matching coefficients of $x^k$ yields:

$$
(k+1) a_{k+1} = -\sum_{j=0}^{k} a_j a_{k-j}, \quad k \geq 1
$$

**Boundary Conditions:** If $y(0) = 0$, then $a_0 = 0$, and $a_1$ is determined by $y'(0) = 1 - y(0)^2 = 1$, i.e., $a_1 = 1$.

**Characteristics:**
- High accuracy near the origin, diverges far from the origin
- Suitable for local analysis and short-time behavior studies

---

## 2. Stability Analysis

### 2.1 Equilibrium Points

Setting $y' = 0$ yields equilibrium points $y = \pm 1$.

### 2.2 Linearized Stability

Near an equilibrium point $y^*$, setting $y = y^* + \epsilon$, linearization gives:

$$
\epsilon' = -2y^* \epsilon + O(\epsilon^2)
$$

- **$y^* = 1$ (stable):** $\epsilon' \approx -2\epsilon$, perturbations decay exponentially
- **$y^* = -1$ (unstable):** $\epsilon' \approx 2\epsilon$, perturbations grow exponentially

### 2.3 Global Behavior

For any initial value $y(0) \in (-1, 1)$, the solution monotonically increases toward $y = 1$; for $y(0) > 1$, the solution monotonically decreases toward $y = 1$. When $y(0) < -1$, the solution tends to $-\infty$ in finite time (blow-up).

The **stability region plot** visually demonstrates the asymptotic behavior of solutions for different initial values.

---

## 3. Asymptotic Stability Rate

### 3.1 Dominant Decay Rate

From linearization analysis, as $x \to \infty$:

$$
y(x) - 1 \sim C e^{-2x}
$$

That is, the solution approaches the stable equilibrium point at an exponential rate $\lambda = 2$.

### 3.2 Higher-Order Corrections

The exact solution $y = \tanh(x + C)$ can be rewritten as:

$$
y = \frac{1 - e^{-2(x+C)}}{1 + e^{-2(x+C)}} = 1 - \frac{2e^{-2(x+C)}}{1 + e^{-2(x+C)}}
$$

Expanding yields a geometric series form, showing that the decay is primarily controlled by $e^{-2x}$ and its higher powers.

---

## 4. Exponential Approximation (Asymptotic Series Expansion)

As $x \to \infty$, expand the solution as an exponential series:

$$
y(x) = \sum_{k=0}^{N} a_k e^{-kx}
$$

**Derivation of Recurrence Relation:**

Setting $q = e^{-x}$, we have $y' = -\sum_k k a_k q^k$ and $y^2 = \sum_n \left(\sum_{j=0}^{n} a_j a_{n-j}\right) q^n$.

Substituting into $y' = 1 - y^2$ and matching coefficients of $q^k$:

- **$k = 0$:** $a_0^2 = 1 \Rightarrow a_0 = 1$ (taking the stable solution)
- **$k = 1$:** $a_1 = 2a_0 a_1 \Rightarrow a_1 = 0$ (forced)
- **$k = 2$:** $a_2$ is a free parameter, determined by the initial condition
- **$k \geq 3$:** recurrence formula

$$
a_k = -\frac{1}{k - 2} \sum_{j=1}^{k-1} a_j a_{k-j}
$$

**Relationship between Initial Condition and $a_2$:**

If $y(0) = y_0$, then $C = \text{artanh}(y_0)$, hence:

$$
a_2 = \frac{2(1 - y_0)}{1 + y_0} = 2e^{-2C}
$$

**Characteristics:**
- High accuracy as $x \to \infty$
- Coefficients can be computed exactly via recurrence, no fitting required
- Odd-order coefficients are zero (if $a_1 = 0$)

---

## 5. Method Comparison

| Method | Applicable Region | Accuracy | Computation Method |
|--------|-------------------|----------|-------------------|
| Polynomial Approximation | $x \approx 0$ | Local high accuracy | Recurrence |
| Stability Analysis | Global qualitative | Qualitative judgment | Linearization |
| Exponential Approximation | $x \to \infty$ | Asymptotic high accuracy | Recurrence |

---

## 6. Code Implementation

- `poly_approx.jl`: Polynomial coefficient recurrence and visualization
- `stable_region.jl`: Stability region and evolution of solutions with different initial values
- `exp_approx.jl`: Exponential expansion coefficient recurrence and asymptotic approximation
