% Author: Laura Train
% Date of the last update Feb 27 2021

clear;clc;

addpath ../conversions
addpath ../conversions/keplers-prob
addpath ../maneuvers

%% data of the problem

alpha = linspace(1,30,20);
beta = linspace(30,100,20);

%% solve
k = 1;

for i = 1:length(alpha)
    dV_HT(i) = HT_nondim(alpha(i));
    for j = i:length(beta)
        dV_BHT(i,j) = BHT_nondim(alpha(i), beta(j));
        k = k + 1;
    end
    k = 1;
end

figure(1)
plot(alpha, dV_HT, 'b', alpha, dV_BHT, 'r')
ylim([0.48,0.56])
