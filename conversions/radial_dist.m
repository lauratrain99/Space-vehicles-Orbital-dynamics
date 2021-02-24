function [r] = radial_dist(a,e,theta)
% Author: Laura Train
% Date of the last update Feb 24 2021

% radial_dist obtains the radial distance in an orbit
%
% INPUT:
%       a, semi-major axis [km]
%       e, eccentricity
%   theta, true anomaly [rad
%
% OUTPUT:
%       r, radial distance [km]
%
%%
    r = a*(1-e^2)/(1+e*cos(theta));
    
end

