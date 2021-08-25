function [deltaV1, deltaV2, deltaV3, deltaV] = BHT(mu, rA, rB, rC)
% Author: Laura Train
% Date of the last update Feb 25 2021

% HT computes the deltaVs related to a Bielliptic Hohmann Transfer
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
    vpA = sqrt(2*mu/rA - 2*mu/(rA + rB));
    vA = sqrt(mu/rA);
    deltaV1 = vpA - vA;
    
    vaB = sqrt(2*mu/rB - 2*mu/(rA + rB));
    vaC = sqrt(2*mu/rB - 2*mu/(rC + rB));
    deltaV2 = vaC - vaB;
    
    vpC = sqrt(2*mu/rC - 2*mu/(rB + rC));
    vC = sqrt(mu/rC);
    deltaV3 = abs(vC - vpC);
    
    deltaV = deltaV2 + deltaV1 + deltaV3;
    
end

