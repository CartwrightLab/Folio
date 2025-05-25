# Continuous-Time Markov Chains

A continuous-time Markov chain is similar to a discrete-time Markov chain, except that transitions between states are not restricted to occur at discrete time points. Here, if we know the state of the stochastic process at a specific time point, then what will happens in the future is independent of what happened in the past.

In the continuous-time analog of our weather model, being wet or dry is now a property of every specific point of time and not restricted to daily summary.

### Definition

Let $X_t$ be a random variable representing the state of a continuous-time Markov chain at time $t$. Therefore, following the Markov property, if $X_t$ is known and $h > 0$, then $X_{t+h}$ is independent of $X_s$ for all $s < t$. The conditional probability that $X_{t+h} = j$ given $X_t = i$ can be defined as $h \to 0$ as

$$\Pr(X_{t+h} = j | X_t = i) = \delta_{ij} + q_{ij} h + o(h)$$

where $\delta_{ij}$ is the Kronecker delta and $q_{ij}$ is non-negative if  $i \ne j$. Here $q_{ij}$ represents how quickly the transition from $i$ to $j$ happens.

Let $P(h)$ be the transition matrix representing the conditional transition between the starting and end points of a time span of length $h$. Consistent with the definition above, $P(h) \approx I + Qh$ as $h \to 0$, where $I$ is the identity matrix and $Q$ is the transition rate matrix. The elements of $Q$ are defined as above where $q_{ij}$ is non-negative if $i \ne j$, and $q_{ii} = - \sum_{j : j \ne i} q_{ij}$ is chosen such that the every row sums to 0.

Now consider a time span of length $t$, subdivided into $n$ independent sections. Since the subdivisions are independent, the total transition matrix is the product of the transition matrices of the individual subdivisions:

$$P(t) \approx \left(I + \frac{Qt}{n} \right)^n$$

If we take the limit as $n \to \infty$, we get the formula for $P(t)$ using matrix exponentiation:

$$\left[\Pr(X_t = j | X_0 = i)\right] = P(t) = \lim_{n \to \infty} \left(I + \frac{Qt}{n} \right)^n = e^{Qt}$$

Another way to define a CTMC is through is through its derivative:

$$\begin{align*}
\frac{d P(t)}{d t} = & \lim_{h->0} \frac{P(t + h) - P(t)}{h}\\
= & \lim_{h->0} \frac{P(t)P(h) - P(t)}{h}\\
= & \lim_{h->0} P(t)\frac{P(h) - I}{h}\\
= & \lim_{h->0} P(t)\frac{I + Qh - I}{h}\\
= & P(t) Q\\
\end{align*}$$

#### Probability of No Mutations

As above, let $Z$ hold the diagonal entries of $Q$ and $J$ hold the off-diagonals, such that $Q = Z + J$. Next let $P^0(t) = \left[p^{(0)}_{ij}(t)\right]$, where $p^{(0)}_{ij}(t) = \Pr(X_t = j \text{ and no mutations} | X_0 = i)$. Therefore,

$$P^{(0)}(t) = \lim_{n \to \infty} \left(I + \frac{Zt}{n} \right)^n = e^{Zt}$$

#### Probability of One Mutation

Define $P^{(1)}(t)$ similar to $P^{(0)}(t)$ as the joint probability of $X_t$ and one mutation given $X_0$.

$$P^{(1)}(t) = \lim_{n \to \infty} \sum_{k=1}^n
\left(I + \frac{Zt}{n} \right)^{k-1}
\frac{J t}{n} \left(I + \frac{Zt}{n} \right)^{n-1}$$

Following the solution for DTMC, if $q_{ii} = q_{jj}$ then

$$p^{(1)}_{ij}(t) = \lim_{n \to \infty}
n \frac{q_{ij} t}{n}\left(I + \frac{q_{ii}t}{n} \right)^{n-1} =
q_{ii} t e^{q_{ii} t}$$

If $q_{ii} \ne q_{ij}$,

$$\begin{align}
p^{(1)}_{ij}(t) = & \lim_{n \to \infty}
\frac{q_{ij} t}{n} \frac{\left(I + \frac{q_{ii}t}{n} \right)^n - \left(I + \frac{q_{jj}t}{n} \right)^n}{\left(I + \frac{q_{ii}t}{n} \right)-\left(I + \frac{q_{jj}t}{n} \right)}\\
= & q_{ij} t \frac{e^{q_{ii}t} - e^{q_{jj}t}}{q_{ii}t - q_{jj} t}
\end{align}$$



#### K-alleles Model

In a K-alleles model there are a total of $k$ different alleles, and the mutation rates between alleles are identical. Under this model, $q_{ij} = \frac{1}{k-1}$ if $i \ne j$, and $-1$ if $i = j$.