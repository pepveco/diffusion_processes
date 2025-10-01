% This script computes and plots the q-Gaussian distribution
% for a chosen value of q1. The code covers three regimes:
%   (i) q < 1: compact support distribution
%   (ii) q = 1: standard Gaussian distribution
%   (iii) 1 < q < 3: fat-tailed distribution
% The normalization constant A_q1 is computed separately
% for each regime, and the density is plotted over x.

N = 10000;            % number of grid points
q1 = 2;               % Tsallis parameter q
q = (1 + q1)/(3 - q1);% computed but not used later
beta = 1/(3 - q1);    % inverse scale parameter

x = linspace(-10,10,N); % x-grid where the density is evaluated

if q1 < 1
    
    % Normalization constant valid for q < 1
    A_q1 = (2*sqrt(pi)*gamma(1/(1 - q1))) / ...
           ((3 - q1)*sqrt(1 - q1)*gamma((3 - q1)/(2 - 2*q1)));

    % Preallocate q-exponential array
    exp_q_minus_beta_xsquared = zeros(1,length(x));

    % Evaluate the q-exponential with support condition
    for ii = 1:length(x)
        if (1 + (q1 - 1)*beta*(x(ii)^2)) > 0
            exp_q_minus_beta_xsquared(ii) = ...
                (1 + (q1 - 1)*beta*(x(ii)^2))^(1/(1 - q1));
        else
            exp_q_minus_beta_xsquared(ii) = 0;
        end
    end

    % Normalized q-Gaussian density
    y = (sqrt(beta)/A_q1).*exp_q_minus_beta_xsquared;

elseif q1 == 1
    
    % In the limit q → 1 the distribution becomes Gaussian
    A_q1 = sqrt(pi);
    y = (sqrt(beta)/A_q1)*exp(-beta.*x.^2);

elseif q1 < 3 && q1 > 1
    
    % Normalization constant valid for 1 < q < 3
    A_q1 = (sqrt(pi)*gamma((3 - q1)/(2*q1 - 2))) / ...
           (sqrt(q1 - 1)*gamma(1/(q1 - 1)));

    % Preallocate q-exponential array
    exp_q_minus_beta_xsquared = zeros(1,length(x));

    % Evaluate the q-exponential with support condition
    for ii = 1:length(x)
        if (1 + (q1 - 1)*beta*(x(ii)^2)) > 0
            exp_q_minus_beta_xsquared(ii) = ...
                (1 + (q1 - 1)*beta*(x(ii)^2))^(1/(1 - q1));
        else
            exp_q_minus_beta_xsquared(ii) = 0;
        end
    end

    % Normalized q-Gaussian density
    y = (sqrt(beta)/A_q1).*exp_q_minus_beta_xsquared;

end

% Plot the resulting distribution
plot(x,y,'LineWidth',1.2)
xlabel('$x$','Interpreter','latex')
ylabel('$p(x)$','Interpreter','latex')
hold on

title('Distribuzione q-Gaussiana','Interpreter','latex')
legend('q = 1','q = 1.5','q = 2 ','Location','northeast')
