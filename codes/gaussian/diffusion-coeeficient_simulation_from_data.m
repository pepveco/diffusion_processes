clear all
close all

% -------------------------------------------------------------------------
% This script compares single-trajectory r^2(t) with the ensemble-averaged
% MSD and the Einstein theoretical law in 2D:
%   <r^2(t)> = 4 D t
% Visual choices: few light-gray sample paths, thick blue MSD, thick red theory.
% -------------------------------------------------------------------------

T = 1000;      % number of time steps
N = 200;       % number of particles (increase to reduce noise in the MSD)
d = 1.0e-6;    % particle diameter [m]
eta = 1.0e-3;  % water viscosity [Pa·s]
kB = 1.38e-23; % Boltzmann constant [J/K]
Temp = 293;    % temperature [K]
D = kB * Temp / (3 * pi * eta * d); % diffusion coefficient [m^2/s]

tau  = 1;                        % time step [s]
time = tau * (1:T);              % time vector
k     = sqrt(2*D*tau);           % std of Gaussian increments per axis

% Generate 2D Brownian trajectories (independent x/y increments)
dx = k * randn(T, N);
dy = k * randn(T, N);
x  = cumsum(dx);
y  = cumsum(dy);

% r^2(t) for each particle; MSD = ensemble average over particles
r2  = x.^2 + y.^2;     % T-by-N
MSD = mean(r2, 2);     % T-by-1
MSD_theory = 4 * D * time(:);  % Einstein law in 2D

% ----------------------------- PLOT --------------------------------------
figure('Position',[100 100 820 520]) % larger, more readable figure
hold on; grid on; box on

% A handful of single realizations in light gray (readable but unobtrusive)
plot(time, r2(:,1:6), 'Color', [0.75 0.75 0.75], 'LineWidth', 1)

% Ensemble MSD in thick blue
plot(time, MSD, 'b-', 'LineWidth', 2.5)

% Theory 4 D t in thick red, dashed
plot(time, MSD_theory, 'r--', 'LineWidth', 2.5)

xlabel('Tempo')
ylabel('$\langle r^{2}(t) \rangle$','Interpreter','latex')
title('Andamento del MSD in funzione del tempo','Interpreter','latex')
legend('Realizzazioni singole','MSD ensemble','Teoria $4Dt$', ...
       'Location','northwest','Interpreter','latex')
set(gca,'FontSize',14)
