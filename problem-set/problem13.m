% Author: Laura Train
% Date of the last update Feb 24 2021

clear;clc;

addpath ../solve-non-linear

%% Data of the problem
f = @(x) cos(x) - x;
df = @(x) -sin(x) - 1;
x0 = 0.75;
tol = 1e-8;
maxiter = 100;
[x, dx_x, it] = newton(f,df,x0,tol,maxiter);

fprintf("The root around 0.75 is %.4f \n", x)