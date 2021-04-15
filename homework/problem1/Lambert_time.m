function [dT, theta1, theta2, a, e] = Lambert_time(r1, r2, eT_star, k, mu)
% Lambert_time obtains the transfer time between r1 and r2
% for the fundamental ellipse
% INPUTS:
%            r1, 3x1 initial orbital position [km]
%            r2, 3x1 final orbital position [km]
%       eT_star, eccentricity projection along ip
%             k, 3x1 orbital plane perpendicular vector
%            mu, gravitational parameter [km^3/s^2]
%
% OUTPUTS: 
%            dT, transfer time between r1 and r2 [s]
%        theta1, true anomaly of initial orbit [rad]
%        theta2, true anomaly of final orbit [rad]
%             a, semi-major axis
%             e, eccentricity
%
%%
    [e, a, deltaTheta] = Lambert_conic(eT_star, r1, r2, k);
    
    % perifocal reference frame
    W = k;
    P = e/norm(e);
    Q = cross(W,P);
    
    % obtain theta1 and theta 2
    sin_theta1 = dot(r1/norm(r1),Q);
    cos_theta1 = dot(r1/norm(r1),P);
    theta1 = atan2(sin_theta1, cos_theta1);
    theta2 = theta1 + deltaTheta;

    % compute eccentric anomaly
    E1 = theta2E(theta1, norm(e));
    E2 = theta2E(theta2, norm(e));
    
    % compute mean anomaly
    M1 = E2M(E1, norm(e));
    M2 = E2M(E2, norm(e));
    
    % compute time from the periapsis
    t1 = M2dt(M1, mu, a);
    t2 = M2dt(M2, mu, a);
    
    
    % determine the transfer type
%     tm = dot (cross(r1,r2) / norm(cross(r1,r2)),k);
    tm = 1;
    
    % determine time to get a full orbit
    n = sqrt(mu/a^3);
    t_fullorbit = 2*pi/n;
    
    % compute deltaT
    dT = t2 - t1;
    
    % choose the right time 
    % theta1 > 0, theta2 > 0, long arc 
    if dT > 0 && tm < 0
        dT = t_fullorbit - dT;
    % theta1 > 0, theta2<0, long arc
    elseif dT < 0 && tm < 0
        dT = - dT;
    % theta1 > 0, theta2 < 0, short arc
    elseif dT < 0 
        dT = t_fullorbit + dT;
    end
    
end

