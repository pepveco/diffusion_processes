clear all
close all

% -------------------------------------------------------------------------
% This script:
%   1) Draws N i.i.d. q-Gaussian increments using qGaussianDist (q-Box–Muller).
%   2) (Optional, commented) Shows 1D and 2D random motions built from those increments.
%   3) Plots the empirical histogram of the increments and overlays the
%      theoretical q-Gaussian PDF for the same q1.
%
% Notes:
% - Keep qGaussianDist.m on your MATLAB path.
% - The histogram uses 'Normalization','pdf' for direct comparison with theory.
% - The parameter in this script is q1; the theoretical PDF below is written
%   directly in terms of q1 (your convention).
% -------------------------------------------------------------------------

N  = 100000;          % number of samples
t  = 1:N;             % time vector (used only for optional trajectory plots)
q1 = 1.7;             % Tsallis parameter controlling tail heaviness

% Draw q-Gaussian increments (i.i.d.)
b = qGaussianDist(N, q1);

%%%%%%%%%%%%%%%%%%%% OPTIONAL: 1D TRAJECTORIES (KEEP COMMENTED IF NOT USED) %%%%%%%%%%%%%%%%%%%%
% q2 = 1.6
% d = qGaussianDist(N,q2);
% c = cumsum(b);                % 1D q-Gaussian trajectory for q1
% e = cumsum(d);                % 1D q-Gaussian trajectory for q2
% plot(t,c); hold on; plot(t,e)
% xlabel('$t$','Interpreter','LaTex'); ylabel('$x(t)$','Interpreter','LaTex')
% title('Traiettoria 1D con incrementi q-Gaussiani','Interpreter','LaTex')
% legend('q_{1} = 1.3','q_{1}=1.6' ,'Location','northeast')

%%%%%%%%%%%%%%%%%%%% OPTIONAL: 1D q-GAUSS vs GAUSS (KEEP COMMENTED IF NOT USED) %%%%%%%%%%%%%%%%
% c = cumsum(b);                % 1D q-Gaussian trajectory (q1)
% plot(t,c,'-r'); hold on
% g = cumsum(randn(N,1));       % 1D Gaussian trajectory
% plot(t,g,'-g')
% xlabel('$t)$','Interpreter','LaTex'); ylabel('$x(t)$','Interpreter','LaTex')
% title('Confronto q_Gaussian e Gaussian','Interpreter','LaTex')
% legend('q-gauss q_{1} =1.5 q=1.6667','gauss' ,'Location','northeast')

%%%%%%%%%%%%%%%%%%%% OPTIONAL: 2D TRAJECTORY FROM q-GAUSSIAN INCREMENTS %%%%%%%%%%%%%%%%%%%%%%%%
% d = qGaussianDist(N,q1);
% c = cumsum(b);                % x(t)
% e = cumsum(d);                % y(t)
% plot(c,e)
% xlabel('$x(t)$','Interpreter','LaTex'); ylabel('$y(t)$','Interpreter','LaTex')
% title('Traiettoria 2D con incrementi q-Gaussiani','Interpreter','LaTex')
% legend('q_{1} =1.5 q=1.6667' ,'Location','northeast')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% -------------------------------------------------------------------------
% Empirical histogram of the q-Gaussian samples and theoretical PDF overlay
% -------------------------------------------------------------------------
histogram(b,'Normalization','pdf'); hold on

x = linspace(-10,10,N);

% Parameter beta used in the standard q-Gaussian PDF form (your convention)
beta = 1/(3 - q1);

%%%%%%% THEORETICAL STANDARD q-GAUSSIAN (zero mean) %%%%%%%%%%%%%%%%%%%%%%%
% The PDF is expressed in terms of q1. For q1<1 it has compact support; for
% 1<q1<3 it is heavy-tailed; q1=1 recovers the Gaussian.

if q1 < 1

    % Normalization constant A_q1 (compact support)
    A_q1 = (2*sqrt(pi)*gamma(1/(1 - q1))) / ((3 - q1)*sqrt(1 - q1)*gamma((3 - q1)/(2 - 2*q1)));

    % Build q-exponential part respecting its domain
    exp_q_minus_beta_xsquared = zeros(1,length(x));
    % Domain check coming from the q-exponential definition
    for ii = 1:length(x)
        if (1 + ((q1 - 1)*beta)*(x(ii)^2)) > 0
            exp_q_minus_beta_xsquared(ii) = (1 + ((q1 - 1)*beta)*(x(ii)^2))^(1/(1 - q1));
        else
            exp_q_minus_beta_xsquared(ii) = exp_q_minus_beta_xsquared(ii); %#ok<AGROW>
        end
    end

    y = (sqrt(beta)/A_q1) .* exp_q_minus_beta_xsquared;

elseif q1 == 1

    % Gaussian case
    A_q1 = sqrt(pi);
    y = (sqrt(beta)/A_q1) * exp(-beta .* x.^2);

elseif q1 < 3 && q1 > 1

    % Heavy-tailed case (1<q1<3)
    A_q1 = (sqrt(pi)*gamma((3 - q1)/(2*q1 - 2))) / (sqrt(q1 - 1)*gamma(1/(q1 - 1)));

    exp_q_minus_beta_xsquared = zeros(1,length(x));
    for ii = 1:length(x)
        if (1 + ((q1 - 1)*beta)*(x(ii)^2)) > 0
            exp_q_minus_beta_xsquared(ii) = (1 + ((q1 - 1)*beta)*(x(ii)^2))^(1/(1 - q1));
        else
            exp_q_minus_beta_xsquared(ii) = exp_q_minus_beta_xsquared(ii); %#ok<AGROW>
        end
    end

    y = (sqrt(beta)/A_q1) .* exp_q_minus_beta_xsquared;

end

% Overlay theoretical PDF
plot(x,y)
xlabel('$x$','Interpreter','LaTex')
ylabel('$p(x)$','Interpreter','LaTex')
xlim([-13 13])
title('Distribuzione q-Gaussiana','Interpreter','LaTex')
legend('q = 1.7' ,'Location','northwest')
