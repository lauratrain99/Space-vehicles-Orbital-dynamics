% Author: Laura Train
% Date of the last update Feb 8 2021

clear;clc;

addpath ../conversions

%% Problem data

r = [-6045; -3490; 2500];             % km, ECI coords
v = [-3.457; 6.618; 2.533];           % km/s, ECI coords

muE = 3.986e+5;                       % km^3/s^2

%% Classical orbital elements
[a, e, Omega, inc, omega, theta] = rv2coe_nominal(muE, r, v);

fprintf('a = %.2f km \n',a)
fprintf('e = %.2f \n',e)
fprintf('Ω = %.2f º \n',Omega)
fprintf('i = %.2f º \n',inc)
fprintf('w = %.2f º \n',omega)
fprintf('θ = %.2f º \n', theta)