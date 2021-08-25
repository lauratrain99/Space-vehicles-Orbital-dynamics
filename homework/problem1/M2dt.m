function [dt] = M2dt(M,mu,a)
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
    % compute the mean angular rate
    n = sqrt(mu/a^3);
    
    % compute deltatime
    dt = M/n;
    
end

