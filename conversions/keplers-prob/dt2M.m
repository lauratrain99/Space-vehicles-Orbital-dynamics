function M = dt2M(dt, mu,a)
% Author: Laura Train
% Date of the last update Feb 24 2021

% dt2M obtains the mean anomaly from the time interval
%
% INPUT:
%       dt, interval of time [s]
%      mu, gravitational parameter [km^3/s^2]
%       a, semi-major axis [km]
%
% OUTPUT:
%       M, mean anomaly [rad]
%
%%
    n = sqrt(mu/a^3);
    
    M = dt*n;
end
