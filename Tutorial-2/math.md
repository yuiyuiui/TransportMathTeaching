# 1. Basic
Defination of 3d-heat equation:

$$u_t-\alpha \nabla^2 u = f,~u\in L^2(\Omega),~f\in L^2(\Omega), \Omega\in\mathbb{R^3}$$

The initial condition.

The boundary condition: $T(u)=0$.

For simplicity, we only consider the linear boundary condition: $Tu=0$ and the initial condition: $u(x,y,z,0)=u_0(x,y,z)$.

# 2. Fourier transform solution

### 2.1 Basic introduce of Fourier transform on $\mathbb{R^d}$:

##### 1. Definition
Let $u(x) \in L^1(\mathbb{R}^d)$. The Fourier Transform $\mathcal{F}[u]$ (also denoted as $\hat{u}$) is defined as:
$$\hat{u}(\xi) = \int_{\mathbb{R}^d} u(x) e^{-i x \cdot \xi} dx$$

The Inverse Fourier Transform is given by:
$$u(x) = \mathcal{F}^{-1}[\hat{u}](x) = \frac{1}{(2\pi)^d} \int_{\mathbb{R}^d} \hat{u}(\xi) e^{i x \cdot \xi} d\xi$$

---

##### 2. Linear Properties

(1) Translation (Shifting)
For any $h \in \mathbb{R}^d$:
$$\mathcal{F}[u(x - h)](\xi) = e^{-i h \cdot \xi} \hat{u}(\xi)$$

(2) Modulation
For any $\eta \in \mathbb{R}^d$:
$$\mathcal{F}[e^{i \eta \cdot x} u(x)](\xi) = \hat{u}(\xi - \eta)$$

(3) Scaling
For a non-zero constant $a \in \mathbb{R}$:
$$\mathcal{F}[u(ax)](\xi) = \frac{1}{|a|^d} \hat{u}\left(\frac{\xi}{a}\right)$$

---

##### 3. Differentiation Properties

(1) Differentiation with Respect to $x$
The Fourier transform converts differentiation into multiplication by the frequency variable:
$$\mathcal{F}[\partial^\alpha u](\xi) = (i\xi)^\alpha \hat{u}(\xi)$$
where $\alpha$ is a multi-index.

(2) Differentiation with Respect to $\xi$
Multiplying by the spatial variable corresponds to differentiation in the frequency domain:
$$\partial_\xi^\alpha \hat{u}(\xi) = \mathcal{F}[(-ix)^\alpha u(x)](\xi)$$

(3) Differentiation with Respect to Parameters
If $u(x, t)$ depends on a parameter $t$ (such as time in the heat equation), the Fourier operator commutes with the parameter derivative:
$$\mathcal{F}\left[ \frac{\partial u}{\partial t} \right](\xi, t) = \frac{\partial}{\partial t} \hat{u}(\xi, t)$$

---

##### 4. Commutativity and Convolution
The Fourier transform $\mathcal{F}$ satisfies the **Convolution Theorem**, effectively "interchanging" convolution and pointwise multiplication:
$$\mathcal{F}[u * v](\xi) = \hat{u}(\xi) \cdot \hat{v}(\xi)$$
where $(u * v)(x) = \int_{\mathbb{R}^d} u(y)v(x-y) dy$.

---

##### 5. Transform of the Laplacian $\mathcal{F}[\Delta u]$
The Laplacian operator $\Delta = \sum_{j=1}^d \frac{\partial^2}{\partial x_j^2}$ is transformed as follows:
$$\mathcal{F}[\Delta u](\xi) = \sum_{j=1}^d (i\xi_j)^2 \hat{u}(\xi) = -|\xi|^2 \hat{u}(\xi)$$

### 6. Application to the General Heat Equation

For $\Omega = \mathbb{R^3}$, which means there is no boundary condition, take Fourier transform of both sides of the heat equation:
$$-\alpha |\xi|^2 \hat{u}(\xi, t) + \hat{f}(\xi, t) = \frac{\partial \hat{u}}{\partial t}$$

$$\Longrightarrow\hat{u}(\xi, t) = \hat{u}_0 e^{-\alpha |\xi|^2 t} + \int_{0}^{t} e^{-\alpha |\xi|^2 (t - \tau)} \hat{f}(\xi, \tau) d\tau$$

and

$$u(x,t) = \mathcal{F}^{-1}[\hat{u}(\xi, t)](x),~x\in\mathbb{R}^3$$

### 7. Special Case: Solution with No Internal Source ($f=0$)

When there is no internal heat source ($\dot{q} = 0$, hence $f = 0$), the governing equation in the frequency domain simplifies significantly:
$$\hat{u}(\xi, t) = \hat{u}_0(\xi) e^{-\alpha |\xi|^2 t}$$

In this case, the solution in the spatial domain can be expressed as the **convolution of the initial condition and the Heat Kernel**.

#### The Heat Kernel (Fundamental Solution)
Let $K(x, t)$ be the function whose Fourier transform is $\hat{K}(\xi, t) = e^{-\alpha |\xi|^2 t}$. By applying the Inverse Fourier Transform in $\mathbb{R}^3$:
$$K(x, t) = \mathcal{F}^{-1}[e^{-\alpha |\xi|^2 t}] = \frac{1}{(4\pi \alpha t)^{3/2}} e^{-\frac{|x|^2}{4\alpha t}}$$
This function $K(x, t)$ is known as the **Heat Kernel** or the **Fundamental Solution** of the heat equation. It describes how a unit point source of heat at the origin spreads out over time.

#### The Convolution Form
Using the **Convolution Theorem** ($\mathcal{F}[g * h] = \hat{g} \cdot \hat{h}$), we can transform the product in the frequency domain back into a convolution in the spatial domain:
$$u(x, t) = (u_0 * K)(x, t)$$

Writing this out explicitly as an integral over $\mathbb{R}^3$:
$$u(x, t) = \int_{\mathbb{R}^3} u_0(y) \frac{1}{(4\pi \alpha t)^{3/2}} e^{-\frac{|x - y|^2}{4\alpha t}} dy$$

#### Others:

If you are interested in "kernel" and "convolution", please search "good-kernel" on Google and can learn many interesting skills and properties.

# 3. Separation of Variables (continued)



## 3.1 Operator–spectral foundation (why separation-of-variables works)

Let \(A:=-\Delta\) be the Laplace operator on \(L^2(\Omega)\) with the given linear boundary condition \(T(u)=0\) (typical cases: Dirichlet, Neumann, Robin). Under standard hypotheses on \(\Omega\) (bounded, sufficiently regular boundary) and on the boundary condition (self-adjoint, elliptic), the operator \(A\) admits the following properties:

- \(A\) is a nonnegative, self-adjoint, unbounded operator on \(L^2(\Omega)\).
- The spectrum of \(A\) is discrete and consists of a sequence of real eigenvalues
  \[
  0 \le \lambda_1 \le \lambda_2 \le \cdots,\qquad \lambda_n\to\infty,
  \]
  each of finite multiplicity.
- There exists an orthonormal basis \(\{\varphi_n\}_{n=1}^\infty\) of \(L^2(\Omega)\) formed by eigenfunctions of \(A\):
  \[
  A\varphi_n = \lambda_n \varphi_n,\qquad (\varphi_n,\varphi_m)_{L^2(\Omega)}=\delta_{nm}.
  \]

The spectral theorem then gives a functional calculus and, in particular, defines the analytic semigroup \(e^{-\alpha A t}\) (the heat semigroup). The abstract solution formula (mild/variation-of-constants form) is
\[
u(t) = e^{-\alpha A t}u_0 + \int_0^t e^{-\alpha A(t-s)} f(s)\,ds,
\]
which, when expanded in the orthonormal eigenbasis \(\{\varphi_n\}\), is exactly the separation-of-variables modal expansion.

**Remarks on regularity and convergence.** If \(u_0\in L^2(\Omega)\) and \(f\in L^2(0,T;L^2(\Omega))\) the series expansion below converges in \(C([0,T];L^2(\Omega))\). If \(u_0\) and \(f\) are smoother (e.g. \(u_0\in H^k\), \(f\in C^\infty\)), the solution is smoother in space for every \(t>0\) due to the smoothing property of the heat semigroup.

---

## 3.2 General modal expansion (short recap)

Assume \(\{\varphi_n\}\) and \(\{\lambda_n\}\) are the eigenfunctions and eigenvalues of \(A=-\Delta\) with the chosen BC. Expand
\[
u(x,t)=\sum_{n=1}^\infty T_n(t)\,\varphi_n(x),\qquad
u_0(x)=\sum_{n=1}^\infty a_n\varphi_n(x),\qquad
f(x,t)=\sum_{n=1}^\infty F_n(t)\varphi_n(x),
\]
with
\[
a_n=(u_0,\varphi_n)_{L^2(\Omega)},\qquad F_n(t)=(f(\cdot,t),\varphi_n)_{L^2(\Omega)}.
\]
Plugging into the PDE and using orthogonality yields for each \(n\) the ODE
\[
T_n'(t)+\alpha\lambda_n T_n(t)=F_n(t),\qquad T_n(0)=a_n.
\]
Solve by integrating factor (variation of constants):
\[
\boxed{\
T_n(t)=a_n e^{-\alpha\lambda_n t}+\int_0^t e^{-\alpha\lambda_n (t-s)}F_n(s)\,ds.\
}
\]
So the full solution is
\[
\boxed{\
u(x,t)=\sum_{n=1}^\infty\Big(a_n e^{-\alpha\lambda_n t}+\int_0^t e^{-\alpha\lambda_n (t-s)}F_n(s)\,ds\Big)\varphi_n(x).
\ }
\]

---

## 3.3 Classical case: rectangular box \(\Omega=[0,a]\times[0,b]\times[0,c]\) (Dirichlet BC)

Take the concrete domain \(\Omega=[0,a]\times[0,b]\times[0,c]\) and impose homogeneous Dirichlet boundary conditions:
\[
u|_{\partial\Omega}=0.
\]
In this case the eigenfunctions and eigenvalues of \(-\Delta\) are obtained by separation of variables (product of 1D sines):

### 3.3.1 Eigenfunctions and eigenvalues
For \(l,m,n\in\mathbb{N}:=\{1,2,3,\dots\}\), define
\[
\varphi_{lmn}(x,y,z)
=\sqrt{\frac{8}{abc}}\,
\sin\!\Big(\frac{l\pi x}{a}\Big)\,
\sin\!\Big(\frac{m\pi y}{b}\Big)\,
\sin\!\Big(\frac{n\pi z}{c}\Big).
\]
These are orthonormal in \(L^2(\Omega)\) (check: each one-dimensional sine has \(L^2\)-norm \(\sqrt{a/2},\sqrt{b/2},\sqrt{c/2}\), so the product norm squared is \(abc/8\) and the prefactor above normalizes it to 1). The corresponding eigenvalues satisfy
\[
-\Delta\varphi_{lmn}=\lambda_{lmn}\varphi_{lmn},\qquad
\lambda_{lmn}=\pi^2\!\left(\frac{l^2}{a^2}+\frac{m^2}{b^2}+\frac{n^2}{c^2}\right).
\]

### 3.3.2 Expansion coefficients
For initial data \(u_0\in L^2(\Omega)\) and source \(f(\cdot,t)\in L^2(\Omega)\) for each \(t\), expand
\[
u_0(x)=\sum_{l,m,n\ge1} a_{lmn}\varphi_{lmn}(x),\qquad
a_{lmn}=\int_\Omega u_0(x)\varphi_{lmn}(x)\,dx,
\]
\[
f(x,t)=\sum_{l,m,n\ge1} F_{lmn}(t)\varphi_{lmn}(x),\qquad
F_{lmn}(t)=\int_\Omega f(x,t)\varphi_{lmn}(x)\,dx.
\]

### 3.3.3 Modal ODEs and explicit series solution
Each modal amplitude \(T_{lmn}(t)\) satisfies
\[
T_{lmn}'(t)+\alpha\lambda_{lmn}T_{lmn}(t)=F_{lmn}(t),\qquad T_{lmn}(0)=a_{lmn},
\]
so
\[
T_{lmn}(t)=a_{lmn}e^{-\alpha\lambda_{lmn} t}+\int_0^t e^{-\alpha\lambda_{lmn}(t-s)}F_{lmn}(s)\,ds.
\]
Hence the solution is the uniformly written triple series
\[
\boxed{\
u(x,t)=\sum_{l,m,n\ge1}\Big(a_{lmn}e^{-\alpha\lambda_{lmn} t}
+\int_0^t e^{-\alpha\lambda_{lmn}(t-s)}F_{lmn}(s)\,ds\Big)\varphi_{lmn}(x).
\ }
\]

### 3.3.4 Equivalent heat kernel (eigenexpansion) form
The Dirichlet heat kernel for the box admits the eigenexpansion
\[
K_D(x,y,t)=\sum_{l,m,n\ge1} e^{-\alpha\lambda_{lmn} t}\,\varphi_{lmn}(x)\varphi_{lmn}(y).
\]
Using this kernel, the solution can also be written as
\[
\boxed{\
u(x,t)=\int_\Omega K_D(x,y,t)\,u_0(y)\,dy
+\int_0^t\!\int_\Omega K_D(x,y,t-s)\,f(y,s)\,dy\,ds.
\ }
\]
This representation is often convenient for theoretical estimates (Gaussian bounds, smoothing) and for numerical evaluation (truncating the series).
