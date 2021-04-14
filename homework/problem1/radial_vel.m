function [vr] = radial_vel(mu, a, e, theta)
% Author: Laura Train
% Date of the last update Feb 24 2021

% radial_rate obtains the radial rate in an orbit
%
% INPUT:
%      mu, gravitational parameter [km^3/s^2]
%       e, eccentricity
%   theta, true anomaly [rad]
%
% OUTPUT:
%     rdot, radial rate [km/s]
%
%%
    h = sqrt(mu*a*(1-e^2));
    vr = mu/h * e * sin(theta);
    
end
