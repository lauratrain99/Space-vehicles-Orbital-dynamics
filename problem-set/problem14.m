% Author: Laura Train
% Date of the last update Feb 24 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob
addpath ../solve-non-linear
%% Data of the problem

a = 20000;                 % km
e = 0.4;            
theta0 = deg2rad(45);      % deg
mu = 3.986e+5;             % km^3/s^2

%% Part a

r0 = radial_dist(a, e, theta0);
rdot0 = radial_rate(mu, a, e, theta0);
thetadot0 = ang_rate(mu, a, e, theta0);

fprintf("The radial distance at t0 is %.2f km \n", r0)
fprintf("The radial rate at t0 is %.2f km/s \n", rdot0)
fprintf("The angular rate at t0 is %.4f rad/s \n\n", thetadot0)

%% Part b

E0 = theta2E(theta0,e);
M0 = E2M(E0,e);
dt0 = M2dt(M0,mu,a);

fprintf("The time from pericenter to initial position is %.2f min \n", dt0/60);

dt1 = dt0 + 40*60;
M1 = dt2M(dt1,mu,a);
E1 = M2E(M1,e);
theta1 = E2theta(E1,e);
fprintf("The eccentric anomaly after 40 mins is %.2f º \n", rad2deg(E1));
fprintf("The true anomaly after 40 mins is %.2f º \n\n", rad2deg(theta1));

r1 = radial_dist(a, e, theta1);
rdot1 = radial_rate(mu, a, e, theta1);
thetadot1 = ang_rate(mu, a, e, theta1);

fprintf("The radial distance after 40 mins is %.2f km \n", r1)
fprintf("The radial rate after 40 mins is %.2f km/s \n", rdot1)
fprintf("The angular rate after 40 mins is %.4f rad/s \n\n", thetadot1)

