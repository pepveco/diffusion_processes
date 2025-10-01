clear all
close all

% This script estimates the Monte Carlo error of the sample mean
% at a fixed time t_bar for a Gaussian random walk.
% It compares the empirical error vs N against the 1/sqrt(N) scaling
% on a log-log plot, using randomly chosen subsets to avoid selection bias.

T = 1000;         % Length of random walks
N = 10e5;         % Number of random walks to be generated (10e5 = 1e6)
 
N_1 = 10e3;       % First sample size (1e4)
N_2 = 10e4;       % Second sample size (1e5)
N_3 = 10e5;       % Third sample size (1e6)

% Fix the observation time (arbitrary choice)
t_bar  = 60;

sigma = 1;        % Standard deviation of Gaussian increments

% Build full random walks: X(t,n) = sigma * sum of Gaussian increments up to time t
% randn(T,N) ~ N(0,1); cumsum along rows (down the first dimension) creates the walk.
X = sigma * cumsum(randn(T,N)); 

% Extract the positions at the chosen time t_bar across all walkers
X_tbar = X(t_bar,:);

% Randomly select N_1, N_2, N_3 samples from X_tbar to avoid selection bias.
% randsample requires the Statistics Toolbox. If it is not available,
% we fall back to randperm (base MATLAB) for sampling without replacement.
if exist('randsample','file')
    % Sampling using Statistics Toolbox
    W_1 = randsample(X_tbar, N_1);
    W_2 = randsample(X_tbar, N_2);
    W_3 = randsample(X_tbar, N_3);
else
    % Toolbox not available: use randperm to pick indices without replacement
    idx1 = randperm(length(X_tbar), N_1);
    idx2 = randperm(length(X_tbar), N_2);
    idx3 = randperm(length(X_tbar), N_3);
    W_1 = X_tbar(idx1);
    W_2 = X_tbar(idx2);
    W_3 = X_tbar(idx3);
end

% Sample means of each subset
m_1 = mean(W_1);
m_2 = mean(W_2);
m_3 = mean(W_3);

% Compute unbiased sample variance s^2 = sum((W - mean)^2) / (N - 1)
% and standard error of the mean: err = sqrt(s^2) / sqrt(N)
deviation_1 = W_1 - m_1; 
sm_1 = sum(deviation_1.^2) / (N_1 - 1);
err_1 = sqrt(sm_1) / sqrt(N_1);

deviation_2 = W_2 - m_2; 
sm_2 = sum(deviation_2.^2) / (N_2 - 1);
err_2 = sqrt(sm_2) / sqrt(N_2);

deviation_3 = W_3 - m_3; 
sm_3 = sum(deviation_3.^2) / (N_3 - 1);
err_3 = sqrt(sm_3) / sqrt(N_3);

% Collect points (N vs empirical error)
N_tot  = [N_1 N_2 N_3];
err_tot = [err_1 err_2 err_3];

% Plot empirical errors (log-log scale)
loglog(N_tot, err_tot, '.--', 'Markersize', 18)
xlim([10^4 10^6])
ylim([10^-3 1])
xlabel('$N$','Interpreter','latex','FontSize',14)
ylabel('errore MC','Interpreter','latex','FontSize',14)
title('Scaling errore Monte Carlo', 'Interpreter','latex')
hold on

% Add a custom legend entry corresponding to a 1/sqrt(N) guide
% (we keep your legend trick exactly as you wrote it)
h = zeros(1, 1);
h(1) = plot(NaN, NaN, '--', 'color', [0 0.4470 0.7410]);
z = legend(h, '$\frac{1}{\sqrt{N}}$','Interpreter','latex');
set(z,'FontSize',14);
