# Anomalous Diffusion (MATLAB)

This directory collects MATLAB codes for simulating and analyzing **anomalous diffusion processes**, i.e. deviations from standard Brownian motion.  
Two classes of models are included: **Lévy flights** and **q-Gaussian diffusion**.

---

## Structure

- **`levy_flights/`**  
  Scripts to generate and study random walks with increments drawn from **Lévy stable distributions**.  
  - 1D and 2D trajectories for different stability indices $$\alpha$$.  
  - Scaling of variance vs. time (highlighting anomalous, non-Brownian growth).  
  - Comparison between Lévy stable PDFs for different $$\alpha$$ values.

- **`qgaussian/`**  
  Scripts to simulate **q-Gaussian increments** using the generalized Box–Müller algorithm.  
  - Empirical histograms vs. analytical q-Gaussian PDFs.  
  - 1D and 2D random-walk trajectories with q-Gaussian steps.  
  - Comparison with Gaussian random walks to show heavy-tailed effects.


---

## Notes

Differents details and the theoretical discussion are provided in the **thesis** available in the repository under the `docs/` directory.
