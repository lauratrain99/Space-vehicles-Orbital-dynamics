function [dV_nondim] = BHT_nondim(alpha, beta)
% Author: Laura Train
% Date of the last update Feb 27 2021

% HT_nondim computes the deltaV non dimensional realted to a Bielliptic 
% Hohmann Transfer
%
% INPUT:
%     alpha, non dimensional parameter rC/rA 
%      beta, non dimensional parameter rB/rA
%
% OUTPUT:
% dV_nondim, non dimensional velocity difference 
%
%%
    dV_nondim = sqrt(2*(alpha+beta)./(alpha*beta)) - (1 + sqrt(alpha))./sqrt(alpha) - sqrt(2)./(sqrt(beta).*sqrt(1+beta)) * (1 - beta);
    
end
