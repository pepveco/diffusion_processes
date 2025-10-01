clear all
close all

% -------------------------------------------------------------------------
% This script compares trajectories generated from q-Gaussian increments
% (using the generalized Box–Muller method) with Gaussian increments.
%
% What it does:
%   (1) Builds a 2D trajectory (x(t), y(t)) with independent q-Gaussian steps.
%   (2) Builds two 1D random motions on the same time axis:
%         - a q-Gaussian random motion (cumulative sum of q-Gaussian steps)
%         - a Gaussian random motion (cumulative sum of Gaussian steps)
%       and plots them together for comparison.
%
% Requirements:
%   - The function qGaussianDist.m must be in the MATLAB path.
%
% Notes:
%   - For q -> 1 the q-Gaussian reduces to the normal Gaussian distribution.
%   - For q > 1 the distribution has heavy tails → occasional large jumps.
%   - The comparison highlights how heavy-tailed increments affect the walk.
% -------------------------------------------------------------------------

% ------------------------------- Setup -----------------------------------
N  = 10000;     % number of steps
t  = 1:N;       % discrete time vector
q1 = 1.3;       % Tsallis q parameter controlling tail heaviness

% ------------------------- q-Gaussian increments -------------------------
% Two independent sequences for the two coordinate axes (2D path)
bx = qGaussianDist(N, q1);   % increments along x
by = qGaussianDist(N, q1);   % increments along y

% Cumulative sums → random motions
x = cumsum(bx);
y = cumsum(by);

% ----------------------------- Plot (2D) ---------------------------------
figure
plot(x, y, '-b')
hold on
xlabel('$x(t)$','Interpreter','LaTex')
ylabel('$y(t)$','Interpreter','LaTex')
title('Traiettoria 2D con incrementi q-Gaussiani','Interpreter','LaTex')
legend(['$q = ', num2str(q1), '$'], 'Location','northeast','Interpreter','LaTex')
axis equal; grid on

% ---------------------- 1D comparison (q vs Gauss) -----------------------
% q-Gaussian 1D random motion
x_q = cumsum(bx);

% Gaussian 1D random motion (standard normal increments)
x_g = cumsum(randn(N,1));

figure
plot(t, x_q, '-r')
hold on
plot(t, x_g, '-g')

xlabel('$t$','Interpreter','LaTex')
ylabel('$x(t)$','Interpreter','LaTex')
title(['Confronto traiettoria q-Gaussiana e Gaussiana (q = ', num2str(q1), ')'], ...
      'Interpreter','LaTex')
legend(['q-Gauss, $q = ', num2str(q1), '$'], 'Gauss', ...
       'Location','northeast','Interpreter','LaTex')
grid on
