function [E, dE_E, it] = M2E(M,e,tol,maxiter)
% Author: Laura Train
% Date of the last update Feb 24 2021

% M2E obtains the eccentric anomaly from the mean anomaly
%
% INPUT:
%       M, mean anomaly [rad]
%       e, eccentricity
%
% OUTPUT:
%       E, eccentric anomaly [rad]
%    dE_E, error on eccentric anomaly in newton's method
%      it, number of iterations in newton's method

%%
    
    addpath ../../solve-non-linear
    
    f = @(E) E - e*sin(E) - M;
    df = @(E) 1 - e*cos(E);
    
    if ~exist('tol','var')
        tol = 1e-8;
    end
    
    if ~exist('maxiter','var')
        maxiter = 100;
    end
    
    [E, dE_E, it] = newton(f,df,M,tol,maxiter);
    
end

