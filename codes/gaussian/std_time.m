clear all
close all

% This script generates N Gaussian random walks of length T.
% It compares the empirical scaling of the standard deviation
% with the theoretical square-root dependence on time.

T = 1000; % Lunghezza in tempi del random walk
N = 500;  % Numero di random walkers generati

sigma = 1; % Standard deviation of Gaussian increments

% Build random walks:
% randn(T,N) generates Gaussian increments (T x N matrix).
% cumsum accumulates increments along each column, producing N walks.
X = sigma * cumsum(randn(T,N));

%%% Plotting theoretical scaling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 1:1:T; % All time steps
% Theoretical law: sigma(t) ~ sqrt(t)
plot(t, sigma*sqrt(t), '-b', 'LineWidth', 1) 
hold on

%%% Plotting empirical scaling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 1:50:T; % Selected time steps for variance computation
% Compute empirical standard deviation at each chosen time step
plot(t, std(X(t,:)'), 'o', 'MarkerSize', 8, 'MarkerFaceColor', 'r') 

xlim([1 T])
xticks(0:150:T);

xlabel('$t$', 'Interpreter','latex')
ylabel('$\sigma$', 'Interpreter','latex')
set(gca,'FontSize',18)

h = title('Dipendenza di $\sigma$ dal tempo', ...
          'Interpreter','latex');
h.FontSize = 20;
