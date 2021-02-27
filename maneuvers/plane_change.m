function [deltaV] = plane_change(v, Di)
% Author: Laura Train
% Date of the last update Feb 25 2021

% HT computes the deltaVs related to a Bielliptic Hohmann Transfer
%
% INPUT:
%       v, velocity in the orbital plane (old and new) [km/s]
%      Di, change in the inclination [rad]
%
% OUTPUT:
%  deltaV, total velocity difference [km/s]
%
%%
    deltaV = 2*v*sin(Di/2);
    
end

