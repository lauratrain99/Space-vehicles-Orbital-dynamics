% Author: Laura Train
% Date of the last update Feb 8 2021

clear;clc;

addpath ../conversions

%% data
e = 0.4;
Me = 235.4;
tol = 1e-8;
[E, it, error, deltaE] = Me2E(Me, e, tol);