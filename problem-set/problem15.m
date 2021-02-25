% Author: Laura Train
% Date of the last update Feb 25 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob

%% Data for the problem

a = 18000;                       % km
e = 0.1;            
theta0 = deg2rad(20);            % rad
mu = 3.986e+5;                   % km^3/s^2

theta = deg2rad([60, 80, 100, 120, 140, 160, 180, 200]);

%% solve

E0 = theta2E(theta0,e);
M0 = E2M(E0,e);
dt0 = M2dt(M0,mu,a);

fprintf("The time passed from the pericenter to  \n the instant t0 is %.2f mins \n\n", dt0/60);

for i = 1:length(theta)
    E(i) = theta2E(theta(i),e);
    M(i) = E2M(E(i),e);
    dt(i) = M2dt(M(i),mu,a) - dt0;
end

results = table(rad2deg(theta)', rad2deg(E)', rad2deg(M)', dt');
results.Properties.VariableNames = {'theta [deg]'; 'E [deg]'; 'M [deg]'; 't [s]'};
disp(results)
