function [vr] = radial_vel(mu, a, e, theta)
% radial_rate obtains the radial rate in an orbit
%
% INPUT:
%      mu, gravitational parameter [km^3/s^2]
%       a, semi-major axis [km]
%       e, eccentricity
%   theta, true anomaly [rad]
%
% OUTPUT:
%      vr, radial rate [km/s]
%
%%
    h = sqrt(mu*a*(1-e^2));
    vr = mu/h * e * sin(theta);
    
end
