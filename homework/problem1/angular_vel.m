function [vtheta] = angular_vel(mu, a, e, theta)
% Author: Laura Train
% Date of the last update Feb 24 2021

% ang_rate obtains the angular rate in an orbit
%
% INPUT:
%      mu, gravitational parameter [km^3/s^2]
%       e, eccentricity
%   theta, true anomaly [rad]
%
% OUTPUT:
%  th_dot, angular rate [rad/s]
%
%%
    h = sqrt(mu*a*(1-e^2));
    vtheta = mu/h * (1 + e*cos(theta));
    
end