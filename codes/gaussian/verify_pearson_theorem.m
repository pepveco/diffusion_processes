clear all
close all

% This script builds k realizations of a statistic computed from N
% independent 1D Gaussian random walks at a fixed time t_bar.
% For each realization i:
%   1) Generate T Gaussian increments for each of the N walkers.
%   2) Form the random walks via cumulative sums.
%   3) Extract the positions at time t_bar across walkers (vector Y).
%   4) Build Z = (Y.^2)/t_bar and sum its components.
% Under standard increments, Y_j ~ N(0, t_bar), so sum_j (Y_j.^2)/t_bar
% follows a central chi-square distribution with N degrees of freedom.
% The histogram of the collected statistics is compared to chi2pdf(x,N).

T = 1000; % number of times increments are drawn (time horizon)
N = 4;    % number of random walkers
k = 1000; % number of iterations / realizations
sigma = 1; % Std of Gaussian increments (NOTE: not used below)
t_bar  = 60; % fixed observation time

% Preallocate containers for diagnostics (if needed later)
chi   = []; % will store one chi-square statistic per iteration
media = []; % (unused) placeholder to store sample means if you want

for i = 1:k
    % Generate random-walk trajectories: cumsum of standard Gaussian increments
    X = cumsum(randn(T,N)); % T-by-N matrix of positions

    % Extract positions at fixed time t_bar across all N walkers (row vector)
    Y = X(t_bar,:);

    % Build Z_j = (Y_j^2) / t_bar so that sum_j Z_j ~ Chi-square(N)
    % (since each Y_j / sqrt(t_bar) ~ N(0,1))
    % media_i = mean(Y);           % optional: store the sample mean at t_bar
    % media = [media media_i];
    Z = (Y.^2)./t_bar; 
    
    % One chi-square statistic per iteration (sum over the N walkers)
    chi_i_squared = sum(Z); 
    
    % Append to the collection
    chi = [chi chi_i_squared];  
end

% Optional: media_squared = media.^2;
% Optional: non-centrality parameter if using non-zero means:
% mu = sum(media_squared);

% Empirical distribution of the statistic
histogram(chi,'Normalization','pdf')
hold on

% Theoretical chi-square PDF with N degrees of freedom
x = 0:0.2:max(chi);
y = chi2pdf(x,N); 
plot(x,y)

% Axes labels (kept in Italian as you wrote them)
xlabel('$\nu$', 'Interpreter', 'latex');
ylabel('$\chi^{2}(\nu)$', 'Interpreter', 'latex');
% title('$\chi^{2}$', 'Interpreter', 'latex')
% legend('D_{sim}','D_{mean}', 'location', 'NorthEast');
