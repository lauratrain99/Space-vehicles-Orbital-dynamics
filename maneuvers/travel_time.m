function [t] = travel_time(mu, rp, ra)
% Author: Laura Train
% Date of the last update Feb 27 2021

% travel_time computes the time to complete half elliptical orbit
%
% INPUT:
%      mu, gravitational parameter [km^3/s^2]
%      ra, radius of the apocenter [km]
%      rp, radius of the pericenter [km]
%
% OUTPUT:
%       t, total travel time [s]
%
%%
    t = pi * sqrt((rp+ra)^3/(8*mu));
    
end
