# Lévy Flights (MATLAB)

This folder contains MATLAB scripts to simulate **Lévy flights** in 1D and 2D, analyze heavy-tailed α-stable distributions, and compare variance growth for different stability indices α.  
The codes illustrate the anomalous nature of Lévy processes compared to Gaussian (Brownian) diffusion.

---

##Contents

### 1. Distribution
- **`plot_alpha_stable_Levy_distribution.m`**  
  Plots the **PDFs** of symmetric α-stable distributions for different values of α (Gaussian, Cauchy, heavy-tailed).  
  - α = 2 → Gaussian  
  - α = 1 → Cauchy  
  - α = 0.5 → very heavy-tailed Lévy distribution

---

### 2. 1D Lévy Flights
- **`Levy_randomwalks_1D_alvariaredi_alpha.m`**  
  Simulates 1D Lévy flights for α = 2 (Gaussian), α = 1 (Cauchy), and intermediate heavy-tailed α values.  
  - Trajectories display rare, large displacements when α<2.  

---

### 3. 2D Lévy Flights
- **`2D_LEVY_randomwalk_fixing_alpham.m`**  
  Generates a 2D Lévy flight trajectory (X(t), Y(t)) for α=1.2.  
  - Independent α-stable increments in x and y.  
  - For α=2 this reduces to 2D Brownian motion.  

---

### 4. Variance Growth
- **`divergence_std_vs_time_ANOMALOUS.m`**  
  Computes the empirical standard deviation over time for Lévy flights with different α.  
  - α=2 (Gaussian): std ∼ √t.  
  - α<2: variance is infinite, so the empirical std diverges and fluctuates.  
  - Log–log scale highlights anomalous vs Gaussian scaling.  

---

## 📖 Physics Background

- **Stable distributions:**  
  Defined by (α, β, c, μ). Here β=0 (symmetric), μ=0, c=1.  
  - α=2 → Gaussian  
  - α=1 → Cauchy  
  - α<2 → heavy-tailed Lévy stable law (infinite variance)  

- **Lévy flights:**  
  Constructed as  
  \[
  X_n = \sum_{i=1}^n \xi_i, \quad \xi_i \sim S_\alpha(0,1,0).
  \]  
  They produce jumps of arbitrary size in a single step → **infinite velocity**.  

- **Scaling:**  
  For α=2 → diffusive, σ(t) ~ √t.  
  For α<2 → anomalous diffusion: MSD diverges, scaling described by quantiles or distribution tails.

---

## Notes

- These scripts implement **Lévy flights** (instantaneous α-stable jumps).  
- They do **not** implement Lévy walks:  
  - **Flight:** jumps are instantaneous, velocity is unbounded.  
  - **Walk:** jump length and travel time are coupled, ensuring finite velocity.  
- For α<2, the **true variance diverges**: the empirical std is only illustrative.  
- **All detailed derivations, plots, and theoretical discussion are presented in the thesis.**
