function M = E2M(E,e)
% Author: Laura Train
% Date of the last update Feb 24 2021

% E2M obtains the mean anomaly from the eccentric anomaly
%
% INPUT:
%       E, eccentric anomaly [rad]
%       e, eccentricity
%
% OUTPUT:
%       M, mean anomaly [rad]
%
%%
    M = E - e*sin(E);
    
end