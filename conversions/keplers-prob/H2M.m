function M = H2M(H,e)
% Author: Laura Train
% Date of the last update Feb 24 2021

% E2M obtains the mean anomaly from the eccentric anomaly H
%
% INPUT:
%       H, eccentric anomaly for hyperbolas [rad]
%       e, eccentricity
%
% OUTPUT:
%       M, mean anomaly [rad]
%
%%
    M = e*sinh(H) - H;
    
end