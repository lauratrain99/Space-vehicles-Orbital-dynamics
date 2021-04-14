function [e, a, deltaTheta] = Lambert_conic(eT_star, r1, r2, k)
% Lambert_conic obtains the fundamental ellipse parameters
% INPUTS:
%       eT_star, eccentricity projection along ip
%            r1, 3x1 position initial vector [km]
%            r2, 3x1 position final vector [km]
%             k, 3x1 orbital plane perpendicular vector
%
% OUTPUTS:
%             e, 3x1 eccentricity vector of fundamental ellipse
%             a, semi-major axis of fundamental ellipse [km]
%    deltaTheta, angle between r1 and r2 [rad]
%
%%  
    % chord vector
    c = r2 - r1;
    
    % normal vector in c direction
    ic = c/norm(c);
    
    % perpendicular vector
    ip = cross(k,ic);
    
    % eccenticity projection along ic
    eF = - (norm(r2) - norm(r1))/norm(c);
    
    % semi-major axis
    aF = (norm(r1) + norm(r2))/2;
    
    % semi-latus rectum
    pF = aF * (1 - eF^2);
    
    % eccenticity vector
    e = eF*ic + eT_star*ip;
    
    % determine the transfer type
    tm = dot (cross(r1,r2) / norm(cross(r1,r2)),k);
    
    % compute deltaTheta
    deltaTheta = acos((dot(r1,r2)) / (norm(r1)*norm(r2)));
    
    % if long arc    
    if tm < 0
        deltaTheta = 2*pi - deltaTheta;
    end
    
    % obtain semi-latus rectum
    p = pF - eT_star * norm(r1)*norm(r2)/norm(c) * sin(deltaTheta);
    
    % obtain semi-major axis
    a = p / (1 - eF^2 - eT_star^2);
    
end

