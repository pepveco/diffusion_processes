clear all
close all

% -------------------------------------------------------------------------
% This script compares the empirical standard deviation (std) over time
% for Lévy random walks with different stability indices α.
%
% - α = 1   (Cauchy): very heavy tails; theoretical variance is infinite.
% - α = 2   (Gaussian): standard Brownian motion; std ~ sqrt(t).
% - α = 3/2 (stable, heavy-tailed): variance is infinite; empirical std
%   may fluctuate strongly and grow faster than sqrt(t) in finite samples.
%
% We generate N independent walks for each α by summing α-stable increments,
% then compute the empirical std across walkers at selected times t.
% Note: using a log scale on the y-axis highlights growth/scaling trends.
% -------------------------------------------------------------------------

T = 1000; % Length of random walks
N = 500;  % Number of random walks to be generated
    
% Parameters of the stable distribution
alpha_1 = 1;      % Cauchy (heavy-tailed)
alpha_2 = 2;      % Gaussian
alpha_3 = 3/2;    % intermediate heavy-tailed
beta = 0;         % Skewness parameter (0 = symmetric)
c = 1;            % Scale parameter  
mu = 0;           % Location parameter

% Generate Lévy random walks by cumulative sums of α-stable increments
X_1 = cumsum(random('Stable',alpha_1,beta,c,mu,[T N])); % α=1
X_2 = cumsum(random('Stable',alpha_2,beta,c,mu,[T N])); % α=2
X_3 = cumsum(random('Stable',alpha_3,beta,c,mu,[T N])); % α=1.5

% Time grid for empirical std evaluation (sparser to reduce clutter)
t = 1:100:T;

% Plot empirical std across walkers at selected times (log-y scale below)
plot(t, std(X_1(t,:)'), 'o--', 'MarkerSize', 8, 'MarkerFaceColor', 'b') % α=1
hold on
plot(t, std(X_2(t,:)'), 'o--', 'MarkerSize', 8, 'MarkerFaceColor', 'r') % α=2
hold on
plot(t, std(X_3(t,:)'), 'o--', 'MarkerSize', 8, 'MarkerFaceColor', 'y') % α=1.5
hold on

xlim([1 T])
xticks(0:100:T);

xlabel('$t$','Interpreter','LaTex')
ylabel('$\sigma_{Levy}$','Interpreter','LaTex')
set(gca,'FontSize',14)
set(gca,'YScale','log') % log scale emphasizes growth differences

title('Deviazione standard di L\''evy','Interpreter','latex')
legend('$\alpha = 1$','$\alpha=2$','$\alpha$=1.5','interpreter','latex')

% Notes:
% - For α<2 the true variance is infinite; the empirical std is not a
%   consistent descriptor and can show large sample-to-sample variability.
% - For α=2 (Gaussian), std ~ sqrt(t) and curves should align with sqrt(t).
