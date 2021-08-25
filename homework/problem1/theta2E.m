function [E] = theta2E(theta,e)
% theta2E obtains the eccentric anomaly from the true anomaly
%
% INPUT:
%       theta, true anomaly [rad]
%           e, eccentricity
%
% OUTPUT:
%           E, eccentric anomaly [rad]
%
%%
    % compute the eccentric anomaly
    E = acos((e + cos(theta))/(1 + e*cos(theta)));
    
    % choose the correct quadrant
    if mod(theta, 2*pi) > pi
        E = 2*pi - E;
    end
    
end

