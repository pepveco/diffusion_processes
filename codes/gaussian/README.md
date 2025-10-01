# Brownian Motion Simulations (MATLAB)

This repository collects MATLAB scripts for simulating **Brownian motion** in 1D and 2D, verifying scaling laws, and estimating diffusion coefficients.  
The codes are educational and illustrate the connection between **Einstein’s diffusion theory** and **Langevin’s stochastic dynamics**.

---

## 📂 Repository Contents

### Trajectories
- **`1D_brownian_trajectory.m`**  
  Simulates a single-particle Brownian motion in 1D and plots its trajectory.

- **`N_bownian_particles_1D.m`**  
  Simulates multiple independent Brownian trajectories in 1D.  
  Used to study the statistical ensemble of displacements.

- **`single_2D_brownian_particle.m`**  
  Simulates a 2D Brownian trajectory \((x(t), y(t))\).  
  Useful to visualize planar random walks.

---

### Diffusion Coefficient Estimation
- **`diffusion-coeeficient_simulation_from_data.m`**  
  Estimates the diffusion coefficient from simulated trajectory data using the mean squared displacement (MSD).

- **`diffusion_coeffciente_NOT_averaged_over_each_traject.m`**  
  Computes a **single-particle diffusion coefficient** estimate (not ensemble averaged).  
  Demonstrates strong noise and variability from trajectory to trajectory.

- **`erorr_bar_diffusion_coefficient.m`**  
  Plots per-particle diffusion coefficient estimates with error bars.  
  Compares single-particle estimates with the average over particles.

---

### Scaling Laws and Statistical Properties
- **`scaling_MC_error.m`**  
  Demonstrates the Monte Carlo error law: the statistical error decays as \(1/\sqrt{N}\).  
  Plots log-log scaling of error vs sample size.

- **`scaling_invariance.m`**  
  Tests scale invariance of Gaussian distributions in Brownian motion:  
  probability densities at different times collapse under rescaling.

- **`std_time.m`**  
  Verifies the time-scaling of the standard deviation \(\sigma(t) \sim \sqrt{t}\).

---

### Theoretical Verifications
- **`equiv_einstein-lagevin.m`**  
  Numerical illustration of the equivalence between Einstein’s diffusion law and Langevin’s noise-driven dynamics.  
  Shows that Gaussian increments at time \(t_2\) are rescaled versions of those at \(t_1\).

- **`verify_pearson_theorem.m`**  
  Verifies Pearson’s theorem: the sum of squared independent Gaussian variables follows a chi-squared distribution.  
  Connects Brownian step increments with \(\chi^2\) statistics.

---

### Documentation
- **`README.md`**  
  This file.

---

## 📖 Physics Background

- **Einstein’s diffusion law (1905):**  
  $\langle r^2(t) \rangle = 2 d D t,$ 
  with \(d\) = number of dimensions, \(D\) = diffusion coefficient.

- **Langevin’s stochastic dynamics (1908):**  
  Brownian motion modeled as  
  $\frac{dx}{dt} = \eta(t), \quad \langle \eta(t)\eta(t')\rangle = 2D\delta(t-t').$
  Integration yields Gaussian-distributed positions with variance \(\sim t\).

- **Connection:**  
  Both approaches lead to Gaussian displacement distributions and the same scaling of variance, proving their equivalence.

---

## 🚀 How to Run

To execute a script:

1. Open **MATLAB**.  
2. Navigate to this folder:
   ```matlab
   cd path/to/this/folder
