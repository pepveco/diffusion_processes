clear all
close all

% This script generates one or more Gaussian random walk trajectories
% (i.e., Brownian motion in discrete time). It first builds the random
% walk by summing Gaussian increments, then plots the trajectory and
% prepares for analysis of scaling properties.

T = 1000; % Length of random walks (number of time steps)
N = 1;    % Number of independent random walks

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Gaussian random walk %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sigma = 1; % Standard deviation of Gaussian increments

% Generate Gaussian random walk trajectories:
% randn(T,N) creates a T-by-N matrix of i.i.d. standard Gaussian samples.
% cumsum(...) sums increments along each column, producing the walk.
% Multiplying by sigma adjusts the variance of increments.
X = sigma * cumsum(randn(T,N));

%%% Plotting trajectories %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plot(1:T, X)   % plot trajectory/trajectories
xlim([1 T])
xlabel('$t$', 'Interpreter', 'latex')
ylabel('$x(t)$', 'Interpreter', 'latex')
title('Traiettoria browniana 1D','Interpreter','latex')
set(gca,'FontSize',18)

%%% Plotting scaling of standard deviation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (to be completed: compute std of position vs sqrt(t) and compare scaling)
