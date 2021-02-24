function dt = M2dt(M,mu,a)
% Author: Laura Train
% Date of the last update Feb 24 2021

% M2dt obtains the time interval from the mean anomaly
%
% INPUT:
%       M, mean anomaly [rad]
%      mu, gravitational parameter [km^3/s^2]
%       a, semi-major axis [km]
%
% OUTPUT:
%      dt, interval of time [s]
%
%%
    n = sqrt(mu/a^3);
    
    dt = M/n;
    
end

