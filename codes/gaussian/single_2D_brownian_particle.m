clear all
close all

% -------------------------------------------------------------------------
% This script generates a 2D Brownian trajectory of a single particle.
% 
% - We simulate two independent 1D Gaussian random walks (X(t), Y(t)).
% - Each is built as the cumulative sum of Gaussian increments with mean 0
%   and variance sigma^2.
% - The resulting curve (X(t), Y(t)) is a 2D random walk path, i.e. a
%   discrete realization of planar Brownian motion.
% -------------------------------------------------------------------------

T = 1000; % Length of random walk (number of time steps)
N = 1;    % Number of independent walkers (here: just one trajectory)

sigma = 1; % Standard deviation of Gaussian increments
mu    = 0; % Mean of Gaussian increments (not used explicitly, increments ~ N(0,1))

% Generate two independent 1D random walks
X_2 = sigma * cumsum(randn(T,N)); 
Y_2 = sigma * cumsum(randn(T,N)); 

% Plot the 2D trajectory
plot(X_2, Y_2)

xlabel('$x(t)$','Interpreter','LaTex')
ylabel('$y(t)$','Interpreter','LaTex')
title('Traiettoria 2D di una particella browniana','Interpreter','LaTex')
set(gca,'FontSize',14)
