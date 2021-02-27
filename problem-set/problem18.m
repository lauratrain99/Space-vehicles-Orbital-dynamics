% Author: Laura Train
% Date of the last update Feb 27 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob
addpath ../maneuvers

%% data of the problem

muE = 3.986e+5;     % km^3/s^2

rA = 7000;          % km
rF = 105000;        % km
raB = 210000;       % km

%% solve

[~, ~, ~, dV_BHT] = BHT(muE, rA, raB, rF);
[~, ~, dV_HT] = HT(muE, rA, rF);

fprintf("The total dV of a BHT is %.2f km/s \n\n", dV_BHT)
fprintf("The total dV of a HT is %.2f km/s \n\n", dV_HT)

HT_time = travel_time(muE, rA, rF);
BHT_time = travel_time(muE, rA, raB) + travel_time(muE, rF, raB);

fprintf("The total flight time for the HT is %.2f h \n\n", HT_time/3600)
fprintf("The total flight time for the BHT is %.2f h \n\n", BHT_time/3600)

