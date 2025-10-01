clear all
close all

% -------------------------------------------------------------------------
% This script simulates a 2D Lévy trajectory for a stability index α = 1.2.
%
% - Two independent Lévy random walks X(t) and Y(t) are generated
%   by cumulatively summing α-stable increments.
% - The increments are drawn from MATLAB's 'Stable' distribution generator.
% - The resulting trajectory (X(t), Y(t)) explores the plane with heavy-tailed
%   jumps, typical of Lévy processes.
%
% Note: for α = 2 the trajectory reduces to Gaussian 2D Brownian motion.
% -------------------------------------------------------------------------

T = 1000; % Number of time steps
N = 1;    % Number of trajectories

% Parameters of the stable distribution
alpha = 1.2; % Stability index (heavy-tailed)
beta  = 0;   % Skewness parameter (0 = symmetric)
c     = 1;   % Scale parameter
mu    = 0;   % Location parameter

% Generate independent Lévy random walks along X and Y
X = cumsum(random('Stable',alpha,beta,c,mu,[T N])); 
Y = cumsum(random('Stable',alpha,beta,c,mu,[T N])); 

% Plot 2D trajectory
plot(X,Y)

xlabel('$x(t)$','Interpreter','LaTex')
ylabel('$y(t)$','Interpreter','LaTex')
set(gca,'FontSize',14)

h = title('Traiettorie L\`evy 2D per ${\alpha}$=1.2','Interpreter','latex'); 
h.FontSize = 20;

% Alternative (Gaussian case): title('Traiettorie Lévy 2D per \alpha=2','Interpreter','latex')
