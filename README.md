# Diffusion Processes — MATLAB Codes

This repository contains MATLAB code developed for my BSc thesis **“Teoria e simulazione di processi di diffusione”** (Theory and Simulation of Diffusion Processes), Department of Physics, University of Pavia (A.Y. 2021–2022).

> **Language note:** the thesis document included here is in **Italian**.  
> See `docs/tesi_triennale_diffusione.pdf`.

---

## Summary

We numerically study Gaussian and anomalous diffusion through Monte Carlo simulations:
- **Gaussian diffusion** (Wiener/Brownian motion): trajectories, scaling tests, equivalence Einstein–Langevin, 2D MSD and diffusion coefficient estimation.
- **Anomalous diffusion**:
  - **Lévy** (α-stable) random walks in 1D/2D.
  - **q-Gaussian** walks via a generalized Box–Müller generator.

The code reproduces the main figures and tests discussed in the thesis.

---

## Repository Structure

```
diffusion_processes/
├── codes/              # cartella con i codici MATLAB
│   ├── wiener_1D.m
│   ├── brownian_2D.m
│   ├── levy_walk.m
│   └── qgaussian_walk.m
├── thesis/             # cartella con la tesi in PDF
│   └── diffusion_thesis.pdf
├── data/               # cartella con dati e grafici
├── README.md           # file di descrizione
└── LICENSE             # licenza
```
