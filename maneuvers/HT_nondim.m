function [dV_nondim] = HT_nondim(alpha)
% Author: Laura Train
% Date of the last update Feb 27 2021

% HT_nondim computes the deltaV non dimensional realted to a Hohmann
% Transfer
%
% INPUT:
%     alpha, non dimensional parameter rC/rA 
%
% OUTPUT:
% dV_nondim, non dimensional velocity difference 
%
%%
    dV_nondim = 1./sqrt(alpha) - (sqrt(2)*(1-alpha))./(sqrt(alpha).*sqrt(1+alpha)) - 1;
    
end
