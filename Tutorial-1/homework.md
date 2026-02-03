# Homework: Stability Analysis of a Non-autonomous ODE

Consider the ordinary differential equation

$$
y' = e^{-x} - y^2, \qquad x \ge 0,
$$

with initial condition

$$
y(0) = y_0 \in \mathbb{R}.
$$

Using the methods introduced in the tutorial (stability analysis, series expansion, and asymptotic analysis), answer the following questions.

---

## 1. Asymptotic Limit States

Determine all **finite real numbers** $L \in \mathbb{R}$ such that there exists at least one initial value $y(0)$ for which

$$
\lim_{x \to \infty} y(x) = L.
$$

Explain why no other finite limits are possible.

---

## 2. Stable and Unstable Regions of Initial Data

Prove the following statements:

1. If
   $$
   y(0) \in [0, \infty),
   $$
   then the solution converges to the asymptotic limit identified in Question 1.

2. If
   $$
   y(0) \in (-\infty, -1],
   $$
   then the solution is unstable in the sense that it does **not** converge to any finite limit as $x \to \infty$.

*Hint:* Use monotonicity arguments and comparison principles.

---

## 3. Power Series Expansion Near $x = 0$

Assume the solution admits a formal power series expansion near $x = 0$:

$$
y(x) = \sum_{n=0}^{\infty} a_n x^n,
$$

with

$$
a_0 = y(0).
$$

Substitute the series into the differential equation and derive the **general recurrence relation** for the coefficients $a_n$ by matching powers of $x$.

(No need to compute explicit numerical values unless you wish to.)

---

## 4. Asymptotic Convergence Rate in the Stable Region

For initial data

$$
y(0) \in [0, \infty),
$$

determine the **leading-order asymptotic behavior** of $y(x)$ as $x \to \infty$.

In particular, answer the following:

- Does $y(x)$ converge exponentially or algebraically?
- What is the dominant decay rate as $x \to \infty$?

---

### Remarks

- You may assume standard existence and uniqueness results for ordinary differential equations.
- Justify each step clearly; informal but mathematically sound arguments are acceptable.
