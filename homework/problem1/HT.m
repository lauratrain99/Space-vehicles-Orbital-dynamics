function [deltaV1, deltaV2, deltaV] = HT(mu, rA, rC)
% Author: Laura Train
% Date of the last update Feb 25 2021

% HT computes the deltaVs related to a Hohmann Transfer
%
% INPUT:
%      mu, gravitational parameter [km^3/s^2]
%      rA, radius of the initial circular orbit [km]
%      rC, radius of the final circular orbit [km]
%
% OUTPUT:
% deltaV1, first firing velocity difference [km/s]
% deltaV2, second firing velocity difference [km/s]
%  deltaV, total velocity difference [km/s]
%
%%
    vtp = sqrt(2*mu/rA - 2*mu/(rA + rC));
    vA = sqrt(mu/rA);
    deltaV1 = vtp - vA;
    
    vC = sqrt(mu/rC);
    vta = sqrt(2*mu/rC - 2*mu/(rA + rC));
    deltaV2 = vC - vta;
    
    deltaV = deltaV2 + deltaV1;
    
end

