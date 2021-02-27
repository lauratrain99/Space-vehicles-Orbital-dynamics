% Author: Laura Train
% Date of the last update Feb 27 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob
addpath ../maneuvers

%% data of the problem

muE = 3.986e+5;     % km^3/s^2

rp = 8000;          % km
ra = 16000;         % km

%% solve

% Compute the dV to change to a plane 90º change.
% Is it cheaper at the apocenter or pericenter?

Di = pi/2;
vp= sqrt(2*muE/rp - 2*muE/(rp+ra));
va= sqrt(2*muE/ra - 2*muE/(rp+ra));

dVp = plane_change(vp,Di);
dVa = plane_change(va,Di);


fprintf("The dV at the pericenter is %.2f km/s \n", dVp)
fprintf("The dV at the apocenter is %.2f km/s \n", dVa)
fprintf("Cheapear at the apocenter \n\n")





