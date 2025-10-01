clear all
close all

% -------------------------------------------------------------------------
% This script compares symmetric α-stable distributions with different
% stability indices α. The "Stable" distribution in MATLAB is defined
% by four parameters: (alpha, beta, gamma, delta).
%
% - α (0 < α ≤ 2): stability index (controls tail heaviness)
%   α = 2 → Gaussian
%   α = 1 → Cauchy
%   α = 0.5 → very heavy-tailed
% - β = 0: symmetric distribution
% - γ = 1: scale parameter
% - δ = 0: location parameter
%
% The script plots the PDF for α = 2, 1, 0.5 over the same range of x.
% -------------------------------------------------------------------------

% Define stable distributions
pd1 = makedist('Stable','alpha',2,'beta',0,'gam',1,'delta',0);   % Gaussian
pd2 = makedist('Stable','alpha',1,'beta',0,'gam',1,'delta',0);   % Cauchy
pd3 = makedist('Stable','alpha',0.5,'beta',0,'gam',1,'delta',0); % Lévy heavy tail

% Support for evaluation
x = -5:0.1:5;

% Compute PDFs
pdf1 = pdf(pd1,x);
pdf2 = pdf(pd2,x);
pdf3 = pdf(pd3,x);

% Plot results
plot(x,pdf1,'b-');
hold on
plot(x,pdf2,'r-.');
hold on
plot(x,pdf3,'k--');

xlabel('$x$','Interpreter','LaTex')
ylabel('$p(x)$','Interpreter','LaTex')
title('Distribuzione stabile di Lévy al variare del parametro $\alpha$','Interpreter','latex')
legend('\alpha = 2','\alpha = 1','\alpha = 0.5','Location','northwest')
