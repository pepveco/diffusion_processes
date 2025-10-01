clear all
close all

% This script generates N Gaussian random walks of length T.
% It compares the rescaled distributions of positions at two
% different times with the theoretical Gaussian distribution,
% showing the scale invariance of Brownian motion in log scale.

T = 1000; % Length of random walks
N = 500;  % Number of random walks to be generated
sigma = 1; % Standard deviation of Gaussian increments

% Build random walks (increments are Gaussian i.i.d.)
X = sigma * cumsum(randn(T,N));

% Select two different times
t1 = 500; 
t2 = 10;  

% Histogram at time t1
h1 = histogram(X(t1,:),50,'Normalization','PDF'); 
x1 = h1.BinEdges(1:end-1)/sqrt(t1); % rescale x-axis
y1 = h1.Values*sqrt(t1);            % rescale y-axis
delete(h1) % remove histogram plot (keep data only)

% Histogram at time t2
h2 = histogram(X(t2,:),50,'Normalization','PDF'); 
x2 = h2.BinEdges(1:end-1)/sqrt(t2); % rescale x-axis
y2 = h2.Values*sqrt(t2);            % rescale y-axis
delete(h2)

% Theoretical Gaussian distribution
x = linspace(-5*sigma,5*sigma,1000);
y = exp(-x.^2/(2*sigma^2)) / sqrt(2*pi*sigma^2);

%%% Plot in log scale %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure('Position',[100 100 700 500]) % large figure for readability
plot(x,y,'m','LineWidth',2)  
hold on
plot(x1,y1,'ob','MarkerSize',6,'MarkerFaceColor','blue')
plot(x2,y2,'xr','MarkerSize',6,'LineWidth',1.5)

xlabel('$x$','Interpreter','latex')
ylabel('$p(x)$','Interpreter','latex')
set(gca,'YScale','log','FontSize',16)

title('Invarianza di scala moto Browniano','Interpreter','latex')
legend('Gaussiana','t1','t2','Interpreter','latex','FontSize',12)

xlim([-5 5])
xticks(-5:1:5)
