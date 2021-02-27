% Author: Laura Train
% Date of the last update Feb 25 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob
addpath ../maneuvers

%% data of the problem

muE = 3.986e+5;     % km^3/s^2
RE = 6371;          % km

rpA = 480 + RE;     % km
raA = 800 + RE;     % km
raB = 16000 + RE;   % km

%% part a
vpA = sqrt(2*muE/rpA - 2*muE/(rpA+raA));
vpB = sqrt(2*muE/rpA - 2*muE/(rpA+raB));
deltaV1 = vpB - vpA;

fprintf("The dV1 is %.2f km/s \n\n", deltaV1)

%% part b

vaB = sqrt(2*muE/raB - 2*muE/(rpA+raB));
vC = sqrt(muE/raB);
deltaV2 = vC - vaB;

fprintf("The dV2 is %.2f km/s \n\n", deltaV2)

deltaV = deltaV1 + deltaV2;

fprintf("The total dV is %.2f km/s \n\n", deltaV)

