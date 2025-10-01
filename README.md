# Diffusion Processes — MATLAB Codes

This repository contains MATLAB code developed for my BSc thesis **“Teoria e simulazione di processi di diffusione”** (Theory and Simulation of Diffusion Processes), Department of Physics, University of Pavia (A.Y. 2021–2022).

> **Language note:** the thesis document included here is in **Italian**.  
> See `docs/tesi_triennale_conte.pdf`.

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

    diffusion_processes/
    ├── codes/                  # MATLAB code folders
    │   ├── anomalous           # anomalous diffusion
    │   │   ├── levy_flights/   # Lévy flights simulations
    │   │   └── qgaussian/      # q-Gaussian diffusion simulations
    │   └── gaussian/           # standard Brownian motion
    ├── docs/                   # thesis and supporting material
    │   └── tesi_triennale_conte.pdf
    ├── README.md               # general description
    └── LICENSE                 # license

---

## Acknowledgments

I would like to thank **Prof. Guido Montagna** and **Dott.ssa Federica De Domanico** for their guidance and supervision during my bachelor thesis work.
