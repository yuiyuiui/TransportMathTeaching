# ODE（Ordinary Differential Equation）Notes  
（Focus on practical calculation, I have only learned basic calculus）

---

# 1. What is an ODE?

**ODE** is an equation containing unknown functions and their derivatives, and the independent variable is only one (usually denoted as \(x\) or \(t\)).

For example:

\[
y' = 2y
\]

\[
y'' - 3y' + 2y = 0
\]

---

# 2. What is a linear differential equation?

A differential equation is linear if it satisfies:

- The unknown function \(y\) and its derivatives **appear only in the first power**
- The terms **do not multiply**
- The coefficients can be functions of \(x\)

Then it is called a **linear differential equation**.

---

## General form (n-th order)

\[
a_n(x) y^{(n)} + a_{n-1}(x) y^{(n-1)} + \cdots + a_1(x) y' + a_0(x) y = f(x)
\]

- If \(f(x)=0\) → **homogeneous equation**
- If \(f(x)\neq0\) → **inhomogeneous equation**

---

## Example

Linear:

\[
y'' + 2y' + y = \sin x
\]

Non-linear:

\[
y'' + y^2 = 0
\]

（Because \(y^2\) appears in the square）

---

# 3. The structure of the solution of a linear equation

For a linear equation:

$$L[y] = a_n(x) y^{(n)} + a_{n-1}(x) y^{(n-1)} + \cdots + a_1(x) y' + a_0(x) y = f(x)$$

There are $n$ linear-independent $y_1,..,y_n$ s.t. $L[y_k]=0$ for $k=1,..,n$.

And all solutions can be written as:

$$y = c_1 y_1 + c_2 y_2 + \cdots + c_n y_n + y_p$$

where \(y_p\) is a particular solution of \(L[y]=f(x)\). That is to say that $L[y_p]=f(x)$.

---

# 4. 1st order linear ODE

$$y'+P(x)y=Q(x)$$

The solution is:

$$y=e^{-\int P(x)dx}\left(\int Q(x)e^{\int P(x)dx}dx + C\right)$$

## Example

Solve the following equation:

$$y'+2y=e^x$$

The solution is:

$$y=e^{-\int 2dx}\left(\int e^x e^{\int 2dx}dx + C\right)\\
=e^{-2x}\left(\int e^x e^{2x}dx + C\right)\\
=e^{-2x}\left(\int e^{3x}dx + C\right)\\
=e^{-2x}\left(\frac{1}{3}e^{3x} + C\right)\\
=\frac{1}{3}e^{x} + Ce^{-2x}$$

---

# 5. 2nd order linear ODE with constant coefficients

$$y''+ay'+by=f(x)$$

The characteristic equation is:

$$r^2+ar+b=0$$

The discriminant is $\Delta = a^2 - 4b$.

---

## Case 1: Two distinct real roots ($\Delta > 0$)

$$r_1 \neq r_2, \quad r_1, r_2 \in \mathbb{R}$$

The general solution of the homogeneous equation ($f(x)=0$) is:

$$y = c_1 e^{r_1 x} + c_2 e^{r_2 x}$$

---

## Case 2: Repeated real root ($\Delta = 0$)

$$r_1 = r_2 = r = -\frac{a}{2}$$

A single exponential $e^{rx}$ only gives one independent solution. To get a second one, multiply by $x$:

$$y = (c_1 + c_2 x) e^{rx}$$

---

## Case 3: Complex conjugate roots ($\Delta < 0$)

$$r = \alpha \pm \beta i, \quad \alpha = -\frac{a}{2}, \quad \beta = \frac{\sqrt{4b - a^2}}{2}$$

Using Euler's formula $e^{i\theta} = \cos\theta + i\sin\theta$, the general solution is:

$$y = e^{\alpha x}(c_1 \cos\beta x + c_2 \sin\beta x)$$

---

## Example 1: $y'' + \lambda y = 0$ ($\lambda \in \mathbb{R}$)

Here $a=0$, $b=\lambda$. The characteristic equation is:

$$r^2 + \lambda = 0 \implies r = \pm\sqrt{-\lambda}$$

**When $\lambda < 0$**: Let $\lambda = -\mu^2$ ($\mu > 0$), then $\Delta = 4\mu^2 > 0$, two distinct real roots $r = \pm\mu$.

$$y = c_1 e^{\mu x} + c_2 e^{-\mu x}$$

**When $\lambda = 0$**: The equation becomes $y''=0$, i.e. $r^2=0$, repeated root $r=0$.

$$y = c_1 + c_2 x$$

**When $\lambda > 0$**: Let $\lambda = \omega^2$ ($\omega > 0$), then $\Delta = -4\omega^2 < 0$, complex roots $r = \pm\omega i$ ($\alpha=0, \beta=\omega$).

$$y = c_1 \cos\omega x + c_2 \sin\omega x$$

---

## Example 2: $y'' + 2y' + y = 0$

Here $a=2$, $b=1$. The characteristic equation is:

$$r^2 + 2r + 1 = 0 \implies (r+1)^2 = 0$$

Repeated root $r = -1$ ($\Delta = 4 - 4 = 0$). By Case 2:

$$y = (c_1 + c_2 x) e^{-x}$$

