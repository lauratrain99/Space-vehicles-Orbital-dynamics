% Author: Laura Train
% Date of the last update Feb 8 2021

clear;clc;

addpath ../conversions

%% Problem data
a = 20000;                            % km
e = 0.05;                             
Omega = deg2rad(25.4);                % rad
inc = deg2rad(12.5);                  % rad
omega = deg2rad(232.6);               % rad
theta = deg2rad(245.1);               % rad
muE = 3.986e+5;                       % km^3/s^2

%% State vector in S0 - ECI
[r0,v0] = coe2rv(muE,a,e,Omega,inc,omega,theta);

fprintf('The position vector in ECI coordinates is [%.2f, %.2f, %.2f] km \n', r0(1), r0(2), r0(3))
fprintf('The velocity vector in ECI coordinates is [%.2f, %.2f, %.2f] km/s \n\n', v0(1), v0(2), v0(3))

%% State vector in S1 - ECEF

% Rotation velocity of Earth
earth_rate = 1/24 * 2*pi/3600;               % rad/s
w01 = [0;0;earth_rate];
r1 = r0;

% Coriolis theorem
v1 = v0 + cross(w01, r1);

fprintf('The velocity vector in ECEF coordinates is [%.2f, %.2f, %.2f] km/s \n\n', v1(1), v1(2), v1(3))

