clear all
close all

% -------------------------------------------------------------------------
% This script simulates 1D Lévy random walks for different stability indices α.
%
% - For α = 2, the process reduces to a Gaussian random walk (Brownian motion).
% - For α = 1, the increments follow a Cauchy distribution, producing heavy tails
%   and occasional large jumps.
% - For α close to 0, the distribution generates extremely long jumps and the
%   trajectories become visually dominated by rare, large displacements.
%
% The walk is built by cumulative summation of α-stable increments generated
% with MATLAB's "random('Stable',...)" function.
% -------------------------------------------------------------------------

T = 1000; % Length of random walks (number of time steps)
N = 1;    % Number of independent walks generated
t = 1:T;  % Time vector

% Parameters of the stable distribution
alpha0 = 2;   % Gaussian case
alpha1 = 1;   % Cauchy case
% alpha2 = 0.5; % Very heavy-tailed case (disabled for readability)

beta = 0; % Skewness parameter (0 = symmetric distribution)
c    = 1; % Scale parameter
mu   = 0; % Location parameter

% Generate Lévy random walks by summing α-stable increments
X = cumsum(random('Stable',alpha0,beta,c,mu,[T N])); % Gaussian increments
Y = cumsum(random('Stable',alpha1,beta,c,mu,[T N])); % Cauchy increments
% Z = cumsum(random('Stable',alpha2,beta,c,mu,[T N])); % Heavy-tailed (optional)

% Plot trajectories
plot(t,X)
hold on
plot(t,Y)
% hold on
% plot(t,Z)

ylabel('$x(t)$','Interpreter','LaTex')
xlabel('$t$','Interpreter','LaTex')
title('Random walk di L\`evy 1D','Interpreter','LaTex')
legend('$\alpha$=2','$\alpha$=1','Interpreter','latex')
