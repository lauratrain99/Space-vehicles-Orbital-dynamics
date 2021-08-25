% Author: Laura Train
% Date of the last update Feb 8 2021

clear;clc;

addpath ../conversions/orbital-elem

%% Problem data

r = [-6045; -3490; 2500];             % km, ECI coords
v = [-3.457; 6.618; 2.533];           % km/s, ECI coords

muE = 3.986e+5;                       % km^3/s^2

%% Classical orbital elements
state.r = r;
state.v = v;
[coe] = rv2coe(muE, state);


disp(coe)
