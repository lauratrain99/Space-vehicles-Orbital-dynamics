function M = E2M(E,e)
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