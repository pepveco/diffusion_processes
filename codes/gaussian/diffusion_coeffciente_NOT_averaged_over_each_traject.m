clear all
close all

% -------------------------------------------------------------------------
% This script simulates the 2D Brownian motion of a **single particle**
% and computes its mean squared displacement (MSD).
%
% - Physical parameters (d, eta, T, kB, Temp) define the medium and particle.
% - The theoretical diffusion constant D is obtained from Einstein's relation:
%       D = k_B * T / (3 * pi * eta * d)
% - Increments (dx, dy) are Gaussian with variance 2*D*tau,
%   consistent with Langevin dynamics.
% - For N=1, we simulate **only one trajectory** and estimate a
%   "single-particle diffusion coefficient".
%   This estimate is noisy and may differ significantly from the ensemble D.
% - The MSD is compared with the theoretical law:
%       <r^2(t)> = 2 * d * D * t   (with d = number of spatial dimensions)
% -------------------------------------------------------------------------

N = 1;             % number of particles (single trajectory case)
T = 1000;          % number of time steps
dimensions = 2;    % simulation space dimension
d = 1.0e-6;        % particle diameter [m]
eta = 1.0e-3;      % water viscosity [Pa·s]
kB = 1.38e-23;     % Boltzmann constant [J/K]
Temp = 293;        % temperature [K]
D = kB * Temp / (3 * pi * eta * d); % theoretical diffusion coefficient [m^2/s]

tau  = 1;                     % time step [s]
time = tau .* (1:T);          % time vector
k     = sqrt(2*D*tau);        % std of Gaussian increments per axis

% -------------------------------------------------------------------------
% Generate random displacements for a single particle trajectory
% -------------------------------------------------------------------------
dx = k * randn(T,N);
dy = k * randn(T,N);

% Positions obtained by cumulative sums
x = cumsum(dx);
y = cumsum(dy);

% Squared displacements
dSquaredDisplacement = (dx.^2) + (dy.^2); % step-wise squared displacement
squaredDisplacement  = (x.^2) + (y.^2);   % total squared displacement

% -------------------------------------------------------------------------
% Plot: single-trajectory squared displacement vs theory
% -------------------------------------------------------------------------
hold on;
plot(time, (0:(T-1)) * 2*k^2, 'k', 'LineWidth', 1); % theoretical slope line
plot(time, squaredDisplacement, 'b');               % simulated (single particle)

xlabel('Tempo');
ylabel('$\lambda^{2}$','Interpreter','latex');
title('Andamento del MSD in funzione del tempo','Interpreter','latex');

% -------------------------------------------------------------------------
% Estimate "single-particle diffusion coefficient"
% Note: this is not the ensemble-averaged D, but one noisy realization.
% -------------------------------------------------------------------------
simulatedD = mean(dSquaredDisplacement) / (2 * dimensions * tau);

% Standard error from fluctuations along this trajectory
standardError = std(dSquaredDisplacement) / (2 * dimensions * tau * sqrt(N));

% Difference between theoretical D and single-particle estimate
actualError = D - simulatedD;
