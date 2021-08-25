function [period] = orbital_period(a, mu)
% orbital_period obtains the orbital period of an orbit
% INPUTS:
%            a, semi-major axis [km]
%           mu, gravitational parameter [km^3/s]
% OUTPUTS:
%       period, period of the orbit [s]
%  
%%
    period = 2*pi*sqrt(a^3/mu);
    
end

