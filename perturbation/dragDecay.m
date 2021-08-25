clear;clc;
close all;

rho0 = 6e-10;                         % kg/m^3
h0 = 175000;                          % m          
H = 35500;                            % m
mu = 3.986e5*1e9;                     % m^3/s^2
a = 149.67e9;                         % m
Re = 6371e3;                          % m

%% Case 1, Bc = 50 kg/m^2

Bc1 = 50;                              % kg/m^2
h = linspace(180000,300000,1000);
rho1 = rho0 * exp( -(h - h0)/H);

deltaT1 = H*Bc1./sqrt(mu*(Re + h)) * 1./rho1;


r = open('realData.fig');

hold on
plot(h/1000, deltaT1/60/60/24, 'r--')


%% Case 2, Bc = 200 kg/m^2

Bc2 = 200;

rho2 = rho0 * exp( -(h - h0)/H);

deltaT2 = H*Bc2./sqrt(mu*(Re + h)) * 1./rho2;

hold on
plot(h/1000, deltaT2/60/60/24, 'b--')
