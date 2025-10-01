clear all
close all
%%%% Nelle linee di codice seguinti si definiscono gli strumenti necessari per la simulazione$$$$ 
tot_sim = 10; %numero totale di particelle
vec_tot_particles = [];% si inizia il vettore delle particelle
N = 1; %numero di simulazioni
T = 1000; % tempo
dimensions = 2; %dimensioni dello spazio fisico della simulazione
d = 1.0e-6; % diametro in metri
eta = 1.0e-3; % viscosità in Pascal*secondi
kB = 1.38e-23; % constante di Boltzmann 
Temp = 293; % temparatura in kelvin
D = kB * Temp / (3 * pi * eta * d);

tau = 1; % intervallo di temp insecondi
time = tau .*[1:1:T]; % si discretizza il tempo in intervalli da 1 secondo
k = sqrt(2*D*tau);

vec_simulatedD = []; %si inizializza il vettore dei coefficienti di 
                     %Diffusione per ogni particella
vec_standardErrorD = []; %si inizializza il vettore degli errori

for i = 1:tot_sim

  % For each particle, generate a 2D Brownian trajectory:
  % dx,dy ~ N(0, 2*D*tau); cumulative sums give positions (x_i, y_i).
  dx_i= k * randn(T,N);
  dy_i= k * randn(T,N);
  x_i = cumsum(dx_i);
  y_i = cumsum(dy_i);

  % Squared step displacement and squared radial displacement
  dSquaredDisplacement_i = (dx_i.^ 2) + (dy_i .^ 2);
  squaredDisplacement_i  = ( x_i .^ 2) + ( y_i .^ 2);

  % Per-particle diffusion estimate from step variance:
  % D_hat = mean(step^2) / (2 * d * tau), with d = spatial dimensions.
  simulatedD_i = mean( dSquaredDisplacement_i ) / ( 2 * dimensions * tau );

  % Standard error of D_hat from sample variance of step^2 divided by sqrt(#steps)
  standardError_i = std( dSquaredDisplacement_i ) / ( 2 * dimensions * tau * sqrt(T) );
  
  % Store results
  vec_simulatedD    = [ vec_simulatedD simulatedD_i];
  vec_standardErrorD= [ vec_standardErrorD standardError_i];
  vec_tot_particles = [vec_tot_particles i];
 
end

% Ensemble average of per-particle diffusion estimates and its uncertainty
averageD   = mean(vec_simulatedD); 
uncertainty= std(vec_simulatedD) / sqrt(tot_sim); % standard error across particles

%%%%%% Da qui in poi sono elencati comandi per la creazione del plot%%%%%%

% Plot per-particle diffusion estimates with their standard errors:
% x-axis = particle index, y-axis = D_hat, error bars = SE(D_hat)
errorbar(vec_tot_particles, vec_simulatedD, vec_standardErrorD, 'ro'); hold on

xlim([0.5, max(vec_tot_particles) + 0.5 ])

% Plot the average D_hat across particles as a horizontal line
plot(1:(tot_sim+1), averageD * ones(1, tot_sim+1), 'b', 'LineWidth', 2); hold on

% Plot upper/lower average ± SE across particles
plot(1:(tot_sim+1), (averageD + uncertainty) * ones(1, tot_sim+1), 'g-', 'LineWidth', 1); hold on
plot(1:(tot_sim+1), (averageD - uncertainty) * ones(1, tot_sim+1), 'g-', 'LineWidth', 1); hold on

xlabel('Numero di simulazioni');
ylabel('Coefficiente di diffusione simulato');
title('Valori simulati del coefficiente di diffusione $D$','Interpreter', 'latex')
legend('D_{sim}','D_{mean}', 'location', 'NorthEast');
