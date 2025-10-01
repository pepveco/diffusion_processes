# Lévy Flights (MATLAB)

This folder contains MATLAB scripts to simulate **Lévy flights** in $1D$ and $2D$, analyze heavy-tailed $\alpha$-stable distributions, and compare variance growth for different stability indices $\alpha$.  
The codes illustrate the anomalous nature of Lévy processes compared to Gaussian (Brownian) diffusion.

---

##Contents

### 1. Distribution
- **`plot_alpha_stable_Levy_distribution.m`**  
  Plots the **PDFs** of symmetric $\alpha$-stable distributions for different values of $\alpha$ (Gaussian, Cauchy, heavy-tailed).  
  - $\alpha = 2$ → Gaussian  
  - $\alpha = 1$ → Cauchy  
  - $\alpha = 0.5$ → very heavy-tailed Lévy distribution

---

### 2. $1D$ Lévy Flights
- **`Levy_randomwalks_$ 1D$_alvariaredi_alpha.m`**  
  Simulates $1D$ Lévy flights for $\alpha = 2$ (Gaussian), $\alpha = 1$ (Cauchy), and intermediate heavy-tailed $\alpha$ values.  
  - Trajectories display rare, large displacements when $\alpha  < 2$.  

---

### 3. $2D$ Lévy Flights
- **`$2D$_LEVY_randomwalk_fixing_alpham.m`**  
  Generates a $2D$ Lévy flight trajectory $(X(t), Y(t))$ for $\alpha = 1$.2.  
  - Independent $\alpha$-stable increments in x and y.  
  - For $\alpha = 2$ this reduces to $2D$ Brownian motion.  

---

### 4. Variance Growth
- **`divergence_$ \sigma$_vs_time_ANOMALOUS.m`**  
  Computes the empirical standard deviation over time for Lévy flights with different $\alpha$.  
  - $\alpha = 2$ (Gaussian): $\sigma ∼\sqrt(t)$.  
  - $\alpha  < 2$: variance is infinite, so the empirical $ \sigma$ diverges and fluctuates.  
  - Log–log scale highlights anomalous vs Gaussian scaling.  

---

## Notes

- These scripts implement **Lévy flights** (instantaneous $\alpha$-stable jumps).  
- They do **not** implement Lévy walks:  
  - **Flight:** jumps are instantaneous, velocity is unbounded.  
  - **Walk:** jump length and travel time are coupled, ensuring finite velocity.  
- For $\alpha  < 2$, the **true variance diverges**: the empirical $ \sigma$ is only illustrative.  
- **All detailed derivations, plots, and theoretical discussion are presented in the thesis.**
