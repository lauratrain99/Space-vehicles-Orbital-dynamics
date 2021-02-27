% Author: Laura Train
% Date of the last update Feb 25 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob

%% data of the problem

e = 1.1; 
p = 50000;                      % km
t1 = 0;
theta1 = deg2rad(-85.2);        % rad
theta2 = deg2rad(46.5);         % rad
mu = 1266.87e+5;                % km^3/s^2

%% solve

a = p/(1 - e^2);                % km
H1 = theta2H(theta1,e);
H2 = theta2H(theta2,e);

M1 = H2M(H1,e);
M2 = H2M(H2,e);

dt1 = M2dt(M1, mu, a);
dt2 = M2dt(M2, mu, a);

deltat = dt2 + dt1;

fprintf("The total time is %.2f h \n\n", deltat/3600)

