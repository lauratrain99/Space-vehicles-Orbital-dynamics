function [H] = theta2H(theta,e)
% Author: Laura Train
% Date of the last update Feb 24 2021

% theta2E obtains the eccentric anomaly H from the true anomaly
%
% INPUT:
%   theta, true anomaly [rad]
%       e, eccentricity
%
% OUTPUT:
%       H, eccentric anomaly for hyperbolas[rad]
%
%%
    H = acosh((e + cos(theta))/(1 + e*cos(theta)));
    
%     if mod(theta, 2*pi) > pi
%         H = 2*pi - H;
%     end
    
end

