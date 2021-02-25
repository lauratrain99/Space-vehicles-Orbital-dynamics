function [E] = theta2E(theta,e)
% Author: Laura Train
% Date of the last update Feb 24 2021

% theta2E obtains the eccentric anomaly from the true anomaly
%
% INPUT:
%   theta, true anomaly [rad]
%       e, eccentricity
%
% OUTPUT:
%       E, eccentric anomaly [rad]
%
%%
    E = acos((e + cos(theta))/(1 + e*cos(theta)));
    
    if mod(theta, 2*pi) > pi
        E = 2*pi - E;
    end
    
end

