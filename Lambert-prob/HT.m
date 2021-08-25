function [vtp, vta, deltaV] = HT(mu, rA, rC)
% HT computes the deltaVs related to a Hohmann Transfer
%
% INPUT:
%            mu, gravitational parameter [km^3/s^2]
%            rA, radius of the initial circular orbit [km]
%            rC, radius of the final circular orbit [km]
%
% OUTPUT:
%       deltaV1, first firing velocity difference [km/s]
%       deltaV2, second firing velocity difference [km/s]
%        deltaV, total velocity difference [km/s]
%
%%
    % velocity at the periapsis of the transfer ellipse
    vtp = sqrt(2*mu/rA - 2*mu/(rA + rC));
    
    % initial circular velocity
    vA = sqrt(mu/rA);
    
    % deltaV of the first firing
    deltaV1 = vtp - vA;
    
    % final circular velocity
    vC = sqrt(mu/rC);
    
    % velocity at the apoapsis of the transfer ellipse
    vta = sqrt(2*mu/rC - 2*mu/(rA + rC));
    
    % deltaV of the second firing
    deltaV2 = vC - vta;
    
    % total deltaV
    deltaV = deltaV2 + deltaV1;
    
end

