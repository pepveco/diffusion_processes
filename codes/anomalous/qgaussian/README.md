# q-Gaussian Diffusion (MATLAB)

This directory contains MATLAB scripts to generate **q-Gaussian random deviates**, plot their **probability density functions (PDFs)**, and build **random-walk trajectories** with q-Gaussian increments.  
The generator follows the **generalized Box–Müller method** (Thistleton–Nelson–Marsh–Tsallis).

---

## Contents

- **`qGaussianDist.m`**  
  Function to generate random numbers distributed according to a q-Gaussian law.  
  - Input: number of samples $n_{\text{samples}}$ and parameter $q_1$.  
  - Output: a vector of q-Gaussian deviates.

- **`plot_q_gauss.m`**  
  Plots the **theoretical q-Gaussian PDF** for a chosen $q_1$ and compares it with the **empirical histogram** of simulated data.

- **`hist_vs_plot-qgauss.m`**  
  Shows the histogram of simulated q-Gaussian data against the **analytical PDF**, to check consistency between simulation and theory.

- **`qgauss_paths.m`**  
  Builds **random-walk trajectories** with increments distributed as q-Gaussians and compares them with standard Gaussian random walks.  
  Both 1D cumulative paths and 2D trajectories can be visualized.

---

## Background

The **q-Gaussian distribution** is defined as the maximizer of **Tsallis entropy** $S_q$ under suitable constraints.  
- For $q \to 1$ it reduces to the standard Gaussian distribution.  
- For $q < 1$ it has **compact support**.  
- For $1 < q < 3$ it exhibits **heavy tails** (for example, $q = 2$ corresponds to the Cauchy distribution).  

The generalized Box–Müller method replaces the natural logarithm in the standard Box–Müller transform with the **q-logarithm**:  

$
\ln_q(x) = \frac{x^{1-q} - 1}{1-q}, \quad \ln_1(x) = \ln(x).
$  

This produces random deviates distributed according to a q-Gaussian with parameter $q_1$.

Reference:  
W. Thistleton, K. Nelson, J. A. Marsh, C. Tsallis,  
*Generalized Box-Muller method for generating q-Gaussian random deviates*, arXiv:cond-mat/0605570.
