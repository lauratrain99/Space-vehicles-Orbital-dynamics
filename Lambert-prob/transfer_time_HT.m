function [dT, eHT, aHT] = transfer_time_HT(mu, a1, a2)
% transfer_time_HT computes the total transfer time of a Hohmann transfer
% INPUTS:
%       mu, orbital parameter [km^3/s^2]
%       a1, semi-major axis of the initial circular orbit [km]
%       a2, semi-major axis of the final circular orbit [km]
%
% OUTPUTS:
%       dT, total transfer time [s]
%      eHT, eccentricity of the transfer orbit
%      aHT, semi-major axis of the transfer orbit[km]
%
%%
    % parameters of the orbit
    eHT = (a2 - a1)/(a2 + a1);
    aHT = (a2 + a1)/2;

    % compute eccentric anomaly
    E1 = theta2E(0, eHT);
    E2 = theta2E(pi, eHT);

    % compute mean anomaly
    M1 = E2M(E1, eHT);
    M2 = E2M(E2, eHT);

    % compute time from the periapsis
    t1 = M2dt(M1, mu, aHT);
    t2 = M2dt(M2, mu, aHT);
    
    % compute the transfer time
    dT = t2 - t1;
    
end
