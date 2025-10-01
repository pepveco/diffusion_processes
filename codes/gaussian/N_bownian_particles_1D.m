clear all
close all

T = 1000; % Length of random walks
N = 50 ;  % Number of random walks to be generated

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Gaussian random walk %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sigma = 1; % Standard deviation of Gaussian increments

% Build random walk trajectories:
% randn(T,N) generates a T-by-N matrix of i.i.d. standard Gaussian random numbers.
% cumsum sums along each column, producing N independent random walk trajectories.
% Multiplying by sigma adjusts the standard deviation of the increments.
X = sigma * cumsum(randn(T,N)); 

%%% Plotting trajectories %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
plot(1:T, X) 
xlim([1 T])
xlabel('$t$','Interpreter','LaTex')
ylabel('$x(t)$','Interpreter','LaTex')
title('Traiettorie $1D$ di $N$ particelle','Interpreter','Latex')
set(gca,'FontSize',12)
