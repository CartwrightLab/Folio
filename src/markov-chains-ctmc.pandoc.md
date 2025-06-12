# Continuous-Time Markov Processes

A continuous-time Markov process (CTMP) is similar to a discrete-time Markov chain, except that transitions between states can occur at any time and are not restricted to discrete time points. For a CTMP, if we know the state of the stochastic process at a specific time point, then what will happen in the future is independent of what has happened in the past.

In the continuous-time analog of our weather model, being wet or dry is now a property of every specific point of time and not restricted to daily summary.

## Definition

We will define a continuous-time Markov process using a discrete-time Markov chain called the "jump chain" and a set of time points called the "jump times".

Let $Y = \left\{Y_k \in \Sigma : k = 0, 1, \ldots\right\}$ be a discrete-time Markov chain with initial state, $Y_0$ (the jump chain). Let $R = \left[r_{ij}\right]$ be the transition matrix for the jump chain such that $r_{ii} = 0 \; \forall i$. This means that in a single jump, the jump chain must move from one state to a different state.

Let $H = \left\{H_k \in [0,\infty) : k = 1, 2, \ldots\right\}$ be the sequence holding times associated with the jump chain. $H_k$ represents how long the chain was in state $Y_{k-1}$ before jumping to state $Y_{k}$. If $Y_{k-1} = y$, then $H_k$, has an exponential distribution with rate $v_y$.

$$H_k \sim \mathrm{Exponential}\left(v_y\right) : Y_{k-1} = y$$

Using an exponential distribution for holding times is important for creating a Markov process because it is the only continuous-time distribution that is memoryless.

Let $J_k \in [0, \infty)$ be the time when the k-th jump occurred (the jump times) such that $J_0 = 0$ and

$$J_k = \sum_{i=1}^k H_i$$

Let $X = \left\{X(t) \in \Sigma : t \in [0,\infty)\right\}$ be a stochastic process where 

$$X(t) = Y_k \quad \text{for} \quad J_k \le t < J_{k+1}$$

$X$ is a continuous-time Markov process.

Markov property. Let $X(t)$ be a continuous-time Markov process. Then conditional on $X(t) = i$, $X(t+r)$ is independent of $X(s)$ when $r \ge 0$ and $s < t$.

Proof. Let $X(t) = i$ such that $J_m \le t < J_{m+1}$ and $Y_m = i$. Then

$$\begin{align}
\{X(t) = i\} = & \{Y_m = i\} \cap  \{J_m \le t < J_{m+1}\}\\
= & \{Y_m = i\} \cap  \{J_m \le t\} \cap \{H_{m+1} > t - J_m\}
\end{align}$$

Let $\tilde{X}(r) = X(t+r)$. The jump chain $\tilde{Y}_0$, $\tilde{Y}_1$, etc. of $\tilde{X}(r)$ is given by $\tilde{Y}_n = Y_{m+n}$ and
the holding times $\tilde{H}_1$, $\tilde{H}_2$, etc. by

$$\begin{align}
\tilde{H}_1 = & H_{m+1} - (t - J_m)\\
\tilde{H}_n = & H_{m+n} \quad \text{for } n \ge 2\\
\end{align}$$

Since $Y$ is a Markov chain that depends on $Y_0$, $\tilde{Y}$ is also a Markov chain that depends on $\tilde{Y}_0$. Since $\tilde{Y}_0 = Y_m = X(t)$, condition on the event $\{X(t) = i\}$, then $\tilde{Y}$ is a Markov chain independent of $Y_0$ to $Y_{m}$.

Recall that holding times are independent and exponentially distributed, i.e. $H_k$ has an exponential distribution with rate $v_y$ where $y = Y_{k-1}$. First note that by the memoryless property of $H_{m+1}$, $\tilde{H}_1$ is exponentially distributed with rate $v_y$ where $y = \tilde{Y}_0$, and second that $\tilde{H}_{n:n\ge2}$ is exponentially distributed with rate $v_y$ where $y = \tilde{Y}_n$. Next, condition on $\{X(t) = i\}$ and $\tilde{Y}_1$, $\tilde{Y}_2$, etc, then $\tilde{H}_1$, $\tilde{H}_2$, etc. are independent of $H_1$ to $H_m$ and $Y_0$ to $Y_{m}$.

Therefore, conditional on $\{X(t) = i\}$, $\tilde{Y}$ is independent of all $X(s)$ where $s < t$. $\blacksquare$

### Transition Probability Matrices

It can also be shown that this process is homogeneous such that

$$\Pr(X(t+s) = j | X(s) = i) = \Pr(X(t) = j | X(0) = i)$$

Let $P(t) = \left[p_{ij}(t)\right]$ be an $n \times n$ matrix where $n$ is the number of elements in $\Sigma$ and

$$p_{ij}(t) = \Pr(X(t) = j | X(0) = i)$$

Let $\pi(0)$ be an $n \times 1$ (row) vector specifying the initial configuration of the Markov process such that

$$\pi_i(0) = \Pr(X(0) = i)$$

Similarly, let $\pi(t)$ be the vector specifying the marginal distribution of $X(t)$.

$$\begin{align}
\pi_j(t) = \Pr(X(t) = j) = & \sum_i \Pr(X(t) = j, X(0) = i)\\
= & \sum_i \Pr(X(t) = j | X(0) = i) \Pr(X(0) = i)\\
= & \sum_i \pi_i(0) p_{ij}(t)
\end{align}$$

and $\sum_j \pi_j(t) = 1$. Therefore, via matrix multiplication

$$\pi(t) = \pi(0) P(t)$$

### Chapman-Kolmogorov equations

Lemma. Homogeneous continuous-time Markov chains satisfy the Chapman-Kolmogorov equations. For all $\{t,s\} \ge 0$,

$$p_{ij}(t+s) = \sum_k p_{ik}(t) p_{kj}(s)$$

and

$$P(t+s) = P(t)P(s) = P(s)P(t)$$

Proof.

$$\begin{align*}
p_{ij}(t+s) = & \Pr(X(t+s) = j | X(0) = i)\\
 = & \sum_k \Pr(X(t+s) = j, X(t) = k | X(0) = i)\\
 = & \sum_k \Pr(X(t) = k | X(0) = i) \Pr(X(t+s) = j | X_t = k, X(0) = i)\\
 = & \sum_k \Pr(X(t) = k | X(0) = i) \Pr(X(t+s) = j | X_t = k)\\
 = & \sum_k p_{ik}(t) p_{kj}(s) \quad \blacksquare \\
\end{align*}$$


## Transition Rate Matrices and Their Exponentials

We can construct a single matrix that describes the instanteous behavior of a Markov process based on the jump chain and holding time processes. 

Let $Q = \left[q_{ij}\right]$ be an $n \times n$ matrix where $q_{ij : i \ne j}$ are non-negative and $q_{ii} =  - \sum_{j : j \ne i} q_{ij}$ are negative, such that

$$\begin{align}
q_{ij} = & v_i r_{ij} & & \text{if } i \ne j\\
q_{ii} = & -v_i & & \text{otherwise}\\
\end{align}$$

and

$$Q = \mathrm{diag}(\{v_i\}) (R - I)$$

Note that the sum of each row is zero. $Q$ is the transition rate matrix and describes the instanteous behavior of a Markov process. It represents how quickly transitions from $i$ to $j$ happen (for $i \ne j$) and how long the process stays in individual states (for $i = j$).

### Justification

Consider a very small length of time, $h$, such that the chance that two or more jumps occur in the process is negligible. Given $X(0) = i$, the probability of no jump is $e^{-v_ih}$ and the probability of one jump is approximately $1 - e^{-v_ih}$.

Therefore,

$$\begin{align}
p_{ii}(h) = & e^{-v_ih} + o(h)\\
p_{ij}(h) = & \left(1 - e^{-v_i h}\right) r_{ij} + o(h) & \text{if } i \ne j
\end{align}$$

where $o(h)$ uses little-o notation to describe a part of the formula that decreases faster than $h$ does.

Next let's consider what happens as $h \to 0$.

$$\begin{align*}
p_{ii}(h) = & e^{-v_i h} + o(h)\\
= & 1 - v_i h + o(h)\\
= & 1 + q_{ii} h + o(h)\\
\\
p_{ij}(h) = & \left(1 - e^{-v_i h}\right)r_{ij} + o(h)\\
= & \left(1 - 1 + v_i h\right) r_{ij}  + o(h)\\
= & v_i r_{ij} h + o(h)\\
= & q_{ij} h + o(h)
\end{align*}$$

Therefore,

$$\begin{align}
p_{ij}(h) = & [i = j] + q_{ij} h + o(h) && \text{as } h \to 0\\
\end{align}$$

where $[i = j]$ uses Iverson bracket notation for an indicator function.

Lemma. This rate satisfies the Chapman-Kolmogorov equations.

Proof. Let $\{s,t\} < h \to 0$, then

$$\begin{align}
p_{ij}(t+s) = & \sum_k p_{ik}(t) p_{kj}(s)\\
= &\sum_k ([i = k] + q_{ik} t + o(t))\times([k = j] + q_{kj} s + o(s))\\
= & \sum_k [i = k][k = j] + [k = j] q_{ik} t + [i = k] q_{kj} s + o(t+s)\\
= & \sum_k [i = k = j] +  \sum_k [k = j] q_{ik} t + \sum_k [k = i] q_{kj} s + o(t+s)\\
= & [i = j] +  q_{ij} t + q_{ij} s + o(t+s)\\
= & [i = j] +  q_{ij} (t+s) + o(t+s) \quad \blacksquare
\end{align}$$

### Closed-form Solution

Using matrix notation we can calculate $P(t)$ for brief segments of time as

$$P(t) = I + Qt + o(t)$$

But to derive a closed-form solution we will first calculate the derivative matrix of $P(t)$.

$$\begin{align*}
\frac{d P(t)}{d t} = & \lim_{h->0} \frac{P(t + h) - P(t)}{h}\\
= & \lim_{h->0} \frac{P(t)P(h) - P(t)}{h}\\
= & \lim_{h->0} P(t)\frac{P(h) - I}{h}\\
= & \lim_{h->0} P(t)\frac{I + Qh - I + o(h)}{h}\\
= & P(t) Q\\
\end{align*}$$

Therefore, $P(t)$ is the solution to the ordinary differential equation $P^\prime(t) = P(t) Q$ with the initial condition of $P(0) = I$. The solution to this is well known and uses the matrix exponential function

$$P(t) = e^{Qt} = \sum_{k=0}^\infty \frac{1}{k!} \left(Qt\right)^k$$

Therefore,

$$\Pr(X_t = j | X_0 = i) = \left[e^{Qt}\right]_{ij}$$

Alternatively, consider a time length of $t$, subdivided into $m$ independent sections of length $t/m$. Since the subdivisions are independent, the total transition matrix is the product of the transition matrices of the individual subdivisions:

$$P(t) = \left(I + \frac{Qt}{m} + o(\frac{t}{m}) \right)^m$$

If we take the limit as $m \to \infty$, we get

$$P(t) = \lim_{m \to \infty} \left(I + \frac{Qt}{m} \right)^m = e^{Qt}$$

## Uniformization and Poisson Processes

A Markov process may be inhomogeneous because the rates of the holding times can vary depending on the state of the process. However, we can construct a Poisson process which is homogenous but still produces the a stochastic process that is the same as the original Markov process. This is called "uniformization".

First we will choose a rate, $v$, that is at least as large as the largest transition rate of the original process: $v \ge \max(v_i)$. We will assume that there exists a Poisson process that affects stochastic process $X$ with rate $v$. The probability that $X$ experiences $k$ steps during a time span of length $t$ follows a Poisson distribution:

$$\Pr(K = k; t) = \frac{(vt)^k e^{-vt}}{k!}$$

And the holding times between steps follows an exponential distribution:

$$f(t) = v e^{-vt}$$

Note that unlike our previous Markov chains, the rates of this Poisson process are independent of $X(t)$.

Let $\breve{Y} = \left\{\breve{Y}_k \in \Sigma : k = 0, 1, \ldots\right\}$ be a discrete-time Markov chain with initial state, $\breve{Y}_0$ and transition matrix 

$$\breve{R} = \left[\breve{r}_{ij}\right] = I + \frac{Q}{v}$$

Since the Poisson process is independent of $X(t)$, we have introduced virtual events to the transition matrix such that when a step occurs there is a probability that the $\breve{Y}$ will not change state.

Lemma. This uniformized process is identical to a Markov process using transition rate matrix Q.

Proof. The number of steps that $\breve{Y}$ stays in the same state follows a geometric distribution. If $\breve{Y}_n = i$, and $k$ is the number of steps that $\breve{Y}$ stays unchanged, then

$$f(k|i) = \frac{v_i}{v} \left(1 - \frac{v_i}{v}\right)^{k-1}$$

And given $k$, the total length of time $s$ follows an Erlang distribution.

$$f(s | k, i) = \frac{v^k s^{k-1} e^{-v s}}{(k-1)!}$$

Therefore,

$$\begin{align*}
f(s | i) = & \sum_{k=1}^\infty \frac{v_i}{v} \left(1 - \frac{v_i}{v}\right)^{k-1}  \frac{v^k s^{k-1} e^{-v s}}{(k-1)!}\\
= & v_i e^{-v s} \sum_{k=1}^\infty \frac{\left(v s - v_i s\right)^{k-1}}{(k-1)!}\\
= & v_i e^{-v s} e^{v s - v_i s}\\
= & v_i e^{-v_i s}\\
\end{align*}$$

Therefore, as before, holding times following exponential distributions with rates $v_i$.

Next the probability that chain jumps to a new state is

$$\Pr(X_{t+s} = j | X_{t} = i, i \ne j ) = \frac{q_{ij}/v}{v_i/v} = \frac{q_{ij}}{v_i} = r_{ij}$$

which is the same as before. $\blacksquare$

We will next show that $P(t) = e^{Qt}$ by marginalizing over the number of steps taken.

$$\begin{align*}
P(t) = & \sum_{k=0}^\infty \frac{\left(vt\right)^k e^{-v t}}{k!} \breve{R}^k\\
= & e^{-vt}\sum_{k=0}^\infty \frac{v^k t^k}{k!} \left(I + \frac{Q}{v}\right)^k\\
= & e^{-vt} \sum_{k=0}^\infty \frac{t^k}{k!} \left(v I + Q\right)^k\\
= & e^{-vt} e^{\left(v I + Q\right)t}\\
= & e^{Qt}\\
\end{align*}$$

## Stationary Probabilities

Markov chains can have a unique stationary probability vector that is also the limiting probability vector. (This is true for the Markov models we use.) Let $\pi$ be the stationary probability (row) vector. Then the following properties are true.

$$\pi P(t) = \pi \quad\text{and}\quad \sum_i \pi_i = 1$$

$$\lim_{t \to \infty} p_{ij}(t) = \pi_j$$

This has two implications. One, if $X(t)$'s current marginal probability is $\pi$, then the marginal probability will not change. Two, if it is not $\pi$, then it will approach $\pi$ asymptotically. Let $s > 0$, then for all $s$

$$\begin{align}
\pi P(s) = \pi & \implies \frac{d}{ds} \pi P(s) = 0\\
& \implies \pi \frac{d}{ds} P(s) = 0\\
& \implies \pi Q s P(s) = 0\\
& \implies \pi Q = 0\\
\end{align}$$

Therefore, the stationary distribution $\pi$ can be found by solving the system of linear equations given by $\pi Q = 0$ and $\sum_i \pi_i = 1$. Furthermore, consider that $Q = \mathrm{diag}(\{v_i\}) (R - I)$ where $R$ is the jump matrix. Let $w = [w_i]$ where $w_i = \pi_i v_i$, then

$$\begin{align}
\pi Q = 0 \implies & \pi \, \mathrm{diag}(\{v_i\}) (R - I) = 0\\
\implies & w (R - I) = 0\\
\implies & w R = w\\
\end{align}$$

Therefore, the following three statements are equivalent

$$\begin{align}
\pi P(t) = & \pi\\
\pi Q = & 0\\
w R = & w\\
\end{align}$$

## Reversibility

A Markov process is considered time-reversible if for all $i$, $j$, and $t \ge 0$,

$$\Pr(X(0) = i, X(t) = j) = \Pr(X(0) = j, X(t) = i)$$

This is usually not possible unless the process is at equilibrium, and if we assume equilibrium this condition reduce to

$$\pi_i p_{ij}(t) = \pi_j p_{ji}(t)$$

Since both sides are equal we can take the derivative with respect to $t$.

$$\begin{align}
\frac{d}{dt} \pi_i p_{ij}(t) = & \frac{d}{dt} \pi_j p_{ji}(t)\\
\pi_i \frac{d}{dt} p_{ij}(t) = & \pi_j \frac{d}{dt} p_{ji}(t)\\
\pi_i \sum_k p_{ik}(t) q_{kj} = & \pi_j \sum_k p_{jk}(t) q_{ki} \\
\end{align}$$

Evaluating this at $t=0$, we get

$$\begin{align}
\pi_i \sum_k p_{ik}(0) q_{kj} = & \pi_j \sum_k p_{jk}(0) q_{ki} \\
\pi_i q_{ij} = & \pi_j q_{ji} \\
\end{align}$$

Therefore, a continuous-time Markov process will be time-reversible if $\pi_i q_{ij} = \pi_j q_{ji}$ for all $i$ and $j$.

## Application to Mutation

We can use a continuous-time Markov process to represent a mutation process if we let each element of $\Sigma$ represent a different allele and each jump represent a mutation. A few matrices will be important in our calculations, the transition rate matrix $Q$, the diagonal matrix of mutation rates, $V = \mathrm{diag}(v_1, v_2, \ldots)$, and the scaled jump matrix $S = Q + V$.

### Expected Number of Mutations

The number of mutations that occurs in a mutation process is the length of the jump chain. Let $N(X, t)$ be the number of mutations that has occurred to a Markov process by time $t$. Then, the expected number of mutations is

$$E[N(x,t)] = \sum_{k=0}^\infty k \Pr(N(x, t) = k)$$

The event $\{N(x, t) = k\}$ can be expressed in terms of the jump chain:

$$\{N(x, t) = k\} = \{J_k \le t < J_{k+1} \} = \{J_n \le J_k \le t < J_{k+1} \} = \{J_n \le t \} \cap \{J_k \le t < J_{k+1} \}$$

where $1 \le n \le k$. Using this, we will rewrite the expectation as

$$\begin{align}
E[N(x,t)] = & \sum_{k=0}^\infty k \Pr(N(x, t) = k)\\
= & \sum_{k=1}^\infty \sum_{n=1}^k \Pr(N(x, t) = k)\\
= & \sum_{k=1}^\infty \sum_{n=1}^k \Pr(J_n \le J_k \le t < J_{k+1})\\
= & \sum_{n=1}^\infty \sum_{k=n}^\infty \Pr(J_n \le t) \Pr(J_k \le t < J_{k+1} | J_n \le t)\\
= & \sum_{n=1}^\infty \Pr(J_n \le t) \sum_{k=n}^\infty \Pr(J_k \le t < J_{k+1} | J_n \le t)\\
= & \sum_{n=1}^\infty \Pr(J_n \le t)\\
\end{align}$$

Next let $f_n(s)$ be the probability density function of $J_n$ such that $\Pr(J_n \le t) = \int_0^t f_n(s)\;ds$.

$$\begin{align}
E[N(x,t)]
= & \sum_{n=1}^\infty \Pr(J_n \le t)\\
= & \sum_{n=1}^\infty \int_0^t f_n(s)\;ds\\
= & \int_0^t \sum_{n=1}^\infty f_n(s)\;ds\\
= & \int_0^t f(s)\;ds\\
\end{align}$$

where $f(s) =  \sum_{n=1}^\infty f_n(s)$ is the probability density function of there being a mutation at time $s$. We can calculate $f(s)$ through matrix multiplication and summing over the result. Let $M(s, t)$ be a matrix such that the i-j-th element represents the probability density of a mutation happening at time $s$ and $X(t) = j$ given that $X(0) = i$.

$$M(s,t) = P(s) S P(t - s)$$

Therefore,

$$f(s) = \sum_j \sum_i \pi_i \left[M(s,t)\right]_{ij} = \sum_j \left[ \pi M(s,t)\right]_{j}$$

Because our process is at equilibrium, then

$$\begin{align}
\pi M(s,t) = & \pi P(s) S P(t - s)\\
= & \pi S P(t - s)\\
= & \pi Q P(t - s) + \pi V P(t - s)\\
= & \pi V P(t - s)\\
\end{align}$$

Therefore,

$$\begin{align}
f(s) = & \sum_j \sum_i \pi_i v_i p_{ij}(t-s)\\
= & \sum_i \sum_j \pi_i v_i p_{ij}(t-s)\\
= & \sum_i \pi_i v_i \sum_j p_{ij}(t-s)\\
= & \sum_i \pi_i v_i \\
\end{align}$$

which is a constant. And finally,

$$E[N(x,t)] = \int_0^t f(s)\;ds = t \sum_i \pi_i v_i$$

In phylogenetics and molecular evolution, we typically normalize the Q-matrix such that $\sum_i \pi_i v_i = 1$ and $t$ measures the expected number of mutations. This is known as "substitution time". 

### Probability of No Mutations

Let $p^{(0)}_{ij}(t) = \Pr(X(t) = j \text{ and no mutations} | X(0) = i)$ and $P^0(t) = \left[p^{(0)}_{ij}(t)\right]$. Obvious if $i \ne j$, then there has been at least one mutation and $p^{(0)}_{ij} = 0$. If $i = j$, then we can calculate the probability using the probability density function of $H_1$.

$$p^{(0)}_{ii} = \int_t^\infty v_i e^{-v_is} ds = e^{-v_it}$$

Since $V = \mathrm{diag}(\{v_i\})$, this leads to an expression for the full matrix as

$$P^{(0)}(t) = e^{-Vt}$$

### Probability of At Least One Mutation

Let $p^{(1+)}_{ij}(t) = \Pr(X_t = j \text{ and at least one mutation} | X_0 = i)$.

$$P^{(1+)}(t) = P(t) - P^{(0)}(t) = e^{Qt} - e^{-Vt}$$

### Probability of Exactly One Mutation

Define $P^{(1)}(t)$ similar to $P^{(0)}(t)$ as the joint probability of $X_t$ and one mutation given $X_0$. Let $S = Q + V$ be the matrix containing the off-diagonals of $Q$.

$$\begin{align}
P^{(1)}(t) = & \int_0^t e^{-Vs} S e^{-V(t-s)} ds\\
= & \int_0^t e^{-V(t-s)} S e^{-Vs} ds\\
= & e^{-Vt} \int_0^t e^{Vs} S e^{-Vs} ds\\
\end{align}$$

Therefore, $p^{(1)}_{ii}(t) = 0$ and if $i \ne j$,

$$\begin{align}
p^{(1)}_{ij}(t) = & e^{-v_i t} \int_0^t e^{v_i s} q_{ij} e^{-v_j s} ds\\
= & q_{ij} e^{-v_i t} \int_0^t e^{(v_i - v_j) s} ds\\
= & \begin{cases}
q_{ij} t e^{-v_i t} & \text{if} & v_i = v_j\\
q_{ij} t \frac{e^{-v_i t} - e^{- v_j t}}{(-v_i t) - (-v_j t)}
& \text{if} & v_i \ne v_j
\end{cases}
\end{align}$$


