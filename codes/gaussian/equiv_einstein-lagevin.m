clear all
close all

% -------------------------------------------------------------------------
% This script illustrates the equivalence between Einstein's diffusion
% picture and Langevin's stochastic formulation of Brownian motion.
%
% - Einstein: the probability distribution p(x,t) of Brownian displacement
%   is Gaussian with variance proportional to time, Var[x(t)] ~ t.
%
% - Langevin: the particle evolves as dx/dt = eta(t), with Gaussian white
%   noise eta(t). Integrating gives x(t) as a sum of Gaussian increments,
%   which again yields a Gaussian with variance ~ t.
%
% In practice:
% - We generate Gaussian increments with sigma = 1 (corresponding to some
%   reference time t1).
% - We rescale these increments by sqrt(alpha), which corresponds to a
%   longer time t2 = alpha * t1, since Var[x(t)] grows linearly in time.
% - We then compare the histograms with the corresponding Gaussian PDFs.
%
% The result: the distribution at t2 is identical to that at t1, but rescaled
% by sqrt(alpha), showing the Einstein-Langevin equivalence.
% -------------------------------------------------------------------------

T = 500; % Length of random walks
N = 20 ; % Number of random walks
alpha = 10; 
a = sqrt(alpha); % scaling factor between times t1 and t2

% Generate Gaussian increments at time t1 (sigma = 1)
gaussian.increment.pdf = randn(T,N); 

% Generate scaled increments corresponding to time t2 (sigma = sqrt(alpha))
SCALED.gaussian.increment.pdf = a .* gaussian.increment.pdf;

%%% Plotting empirical histograms and theoretical Gaussians %%%%%%%%%%%%%%%

% Histogram of unscaled Gaussian increments (time t1)
h1 = histogram(gaussian.increment.pdf,'Normalization','pdf');
hold on

% Theoretical Gaussian at t1
y = -10:0.1:10;
mu = 0;
sigma = 1;
f = exp(-(y-mu).^2./(2*sigma^2)) ./ (sigma*sqrt(2*pi));
plot(y,f,'LineWidth',1.5)

% Histogram of scaled Gaussian increments (time t2)
h2 = histogram(SCALED.gaussian.increment.pdf,'Normalization','pdf');

% Theoretical Gaussian at t2 (sigma = sqrt(alpha))
y_2 = -20:0.1:20;
mu = 0;
sigma_2 = a;
f2 = exp(-(y_2-mu).^2./(2*(sigma_2)^2)) ./ (sigma_2*sqrt(2*pi));
plot(y_2,f2,'LineWidth',1.5)

% Axis labels and title (kept in Italian)
legend('Dati a $t_1$', 'Gaussiana a $t_{1}$', ...
       'Dati a $t_2$', 'Gaussiana a $t_{2}$', ...
       'Interpreter','latex')
xlabel('$x$','Interpreter','LaTex')
ylabel('$p(x,t)$','Interpreter','LaTex')
title('\rm Equivalenza Einstein-Langevin','Interpreter','latex')
