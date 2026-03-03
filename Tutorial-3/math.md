# 1d heat equation with non-homogeneous boundary conditions (separation of variables method)

---

## 1. Problem Statement

Solve the 1d heat equation:

$$
u_t = \alpha u_{xx}, \alpha>0, 0\leq x\leq1, t\geq0
$$

Boundary conditions:

$$
u(0,t)=1, \qquad u(1,t)=0
$$

Initial condition:

$$
u(x,0)=0, \qquad 0<x<1
$$

---

# 2. Step A: Decomposition of the solution (homogeneous boundary conditions)

Since the boundary conditions are **non-homogeneous**, we cannot separate variables directly.

Let

$$
u(x,t)=v(x)+w(x,t)
$$

---

## 1. Steady-state solution $v(x)$

The steady-state solution satisfies time invariance:

$$
u_t=0
$$

Substitute into the original equation:

$$
\alpha v''(x)=0
$$

So:

$$
v''(x)=0
$$

Two integrations:

$$
v'(x)=C_1
$$

$$
v(x)=C_1 x + C_2
$$

Substitute into the boundary conditions:

$$
v(0)=1 \Rightarrow C_2=1
$$

$$
v(1)=0 \Rightarrow C_1 + 1=0 \Rightarrow C_1=-1
$$

So:

$$
\boxed{v(x)=1-x}
$$

---

## 2. Transient solution $w(x,t)$

By

$$
u=v+w
$$

Substitute into the original equation:

$$
(v+w)_t=\alpha (v+w)_{xx}
$$

Since $v$ does not contain $t$:

$$
w_t=\alpha w_{xx}
$$

Boundary conditions:

$$
w(0,t)=0, \qquad w(1,t)=0
$$

Initial condition:

$$
w(x,0)=u(x,0)-v(x)=0-(1-x)=x-1
$$

---

# 3. Step B: Separation of variables method

Let

$$
w(x,t)=X(x)T(t)
$$

Substitute into the homogeneous equation:

$$
X(x)T'(t)=\alpha X''(x)T(t)
$$

Divide both sides by $\alpha X T$:

$$
\frac{T'}{\alpha T}=\frac{X''}{X}
$$

Since the left side only contains $t$ and the right side only contains $x$, it must be equal to a constant $-\lambda$ ($\lambda>0$):

Thinking: Why $\lambda>0$?

$$
\frac{T'}{\alpha T}=\frac{X''}{X}=-\lambda
$$

---

# 4. Solve the spatial eigenvalue problem

Get ODE:

$$
X''+\lambda X=0
$$

Boundary conditions:

$$
X(0)=0,\qquad X(1)=0
$$

---

## 1. General solution

$$
X(x)=A\cos(\sqrt{\lambda}x)+B\sin(\sqrt{\lambda}x)
$$

Substitute $X(0)=0$:

$$
A=0
$$

So:

$$
X(x)=B\sin(\sqrt{\lambda}x)
$$

Substitute $X(1)=0$:

$$
B\sin(\sqrt{\lambda})=0
$$

For a non-zero solution, we must have:

$$
\sin(\sqrt{\lambda})=0
$$

So:

$$
\sqrt{\lambda}=n\pi, \quad n=1,2,3,\dots
$$

---

## 2. Eigenvalue and eigenfunctions

$$
\boxed{\lambda_n=(n\pi)^2}
$$

$$
\boxed{X_n(x)=\sin(n\pi x)}
$$

---

# 5. Solve the time equation

The time equation:

$$
T'+\alpha \lambda_n T=0
$$

So:

$$
T'=-\alpha (n\pi)^2 T
$$

So:

$$
\boxed{T_n(t)=e^{-\alpha (n\pi)^2 t}}
$$

---

# 6. Combine into a series solution

Single mode:

$$
w_n(x,t)=B_n \sin(n\pi x)e^{-\alpha (n\pi)^2 t}
$$

Linear superposition:

$$
w(x,t)=\sum_{n=1}^{\infty} B_n
\sin(n\pi x)e^{-\alpha (n\pi)^2 t}
$$

---

# 7. Step C: Use the initial condition to find $B_n$

Initial condition:

$$
w(x,0)=x-1 + \chi_{\{1\}}(x)
$$

$\chi_I(x)$ is the indicator function of the set $I$.

$$
\chi_I(x)=
\begin{cases}
1, & x\in I \\
0, & x\notin I
\end{cases}
$$

So:

$$
x-1 + \chi_{\{1\}}(x)=\sum_{n=1}^{\infty} B_n\sin(n\pi x)
$$

---

## 1. Orthogonality

In the interval $[0,1]$:

$$
\int_0^1 \sin(n\pi x)\sin(m\pi x)\,dx=
\begin{cases}
0, & n\neq m \\
\frac12, & n=m
\end{cases}
$$

---

## 2. Multiply by $\sin(m\pi x)$ and integrate

$$
\int_0^1 (x-1 + \chi_{\{1\}}(x))\sin(m\pi x)\,dx
=\int_0^1 (x-1)\sin(m\pi x)\,dx
=\frac12 B_m
$$

So:

$$
\boxed{
B_n=2\int_0^1 (x-1)\sin(n\pi x)\,dx
}
$$

---

# 8. Calculate the integral (integration by parts)

Let

$$
I_n=\int_0^1 (x-1)\sin(n\pi x)\,dx
$$

Integration by parts:

- $u=x-1 \Rightarrow du=dx$
- $dv=\sin(n\pi x)dx \Rightarrow v=-\frac{1}{n\pi}\cos(n\pi x)$

So:

$$
I_n=
\left[
-\frac{x-1}{n\pi}\cos(n\pi x)
\right]_0^1
+
\frac{1}{n\pi}\int_0^1 \cos(n\pi x)dx
$$

---

## 1. Boundary terms

When $x=1$:

$$
0
$$

When $x=0$:

$$
-\frac{-1}{n\pi}\cos(0)=\frac{1}{n\pi}
$$

Note the upper limit minus the lower limit:

$$
0-\frac{1}{n\pi}=-\frac{1}{n\pi}
$$

---

## 2. Cosine integral

$$
\int_0^1 \cos(n\pi x)dx=
\frac{\sin(n\pi)}{n\pi}=0
$$

---

## 3. Get

$$
I_n=-\frac{1}{n\pi}
$$

So:

$$
\boxed{
B_n=2I_n=-\frac{2}{n\pi}
}
$$

---

# 9. Final solution

$$
\boxed{
u(x,t)
=(1-x)-\sum_{n=1}^{\infty}
\frac{2}{n\pi}
\sin(n\pi x)
e^{-\alpha (n\pi)^2 t}
}
$$

---

# 10. Physical interpretation

- When $t\to 0$, the series cancels out $1-x$, satisfying the initial condition $u=0 + \chi_{\{1\}}(x)$.
- When $t\to \infty$, the exponential term decays to 0.
- The limit solution is:

$$
u(x,\infty)=1-x
$$

This is the steady-state temperature distribution.

