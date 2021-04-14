function [v1, v2, g, f, a, e] = Lambert(r1, r2, k, tf, mu, tolerance, maxiter)
% Lambert obtains the velocity vectors for the initial and final 
% positions 
% INPUTS:
%            r1, 3x1 initial orbital position [km]
%            r2, 3x1 final orbital position [km]
%             k, 3x1 vector perpendicular to the rotation
%            mu, gravitational parameter [km^3/s^2]
%     tolerance, tolerance value for the bisection method
%       maxiter, maximum number of iterations
%
% OUTPUTS: 
%            v1, initial velocity [m/s]
%            v2, final velocity [m/s]
%
%%  
    % set default values for tolerance and iterations
    if ~exist('tolerance','var') &&  ~exist('maxiter','var') 
        tolerance = 1e-8;
        maxiter = 100;
    elseif ~exist('maxiter','var')
        maxiter = 100;
    elseif ~exist('tolerance','var')
        tolerance = 1e-8;
    end
    
    % time reference
    tref = sqrt(norm(r1)^3/mu);
    
    % function handle for non dimensional transfer time
    f = @(eT_star) Lambert_time(r1, r2, eT_star, k, mu)/tref;
    
    % function handle to solve non linear equation
    g = @(eT_star) f(eT_star) - tf/tref;
    
    % chord vector
    c = r2 - r1;
    
    % eccenticity projection along ic
    eF = - (norm(r2) - norm(r1))/norm(c);
    
    % get only elliptic limits to input the bisection method
    eTp = sqrt(1 - eF^2);
    xL = - eTp + 0.01;
    xR = eTp - 0.01;
    
    
    % solve for eT using bisection method
    [eT,err,iter] = bisection(g,xL,xR,tolerance,maxiter);
    
    % get orbit characteristics
    [~, theta1, theta2, a, e] = Lambert_time(r1, r2, eT, k, mu);
    
    % solve if the orbit is elliptical
    if norm(e) < 1
        
        % radial component of initial velocity
        er1 = r1/norm(r1);
        vr1 = radial_vel(mu, a, norm(e), theta1);
        
        % angular component of initial velocity
        etheta1 = cross(k, er1);
        vtheta1 = angular_vel(mu, a, norm(e), theta1);
        
        % initial orbit velocity vector
        v1 = vr1 * er1 + vtheta1 * etheta1;
        
        % radial component of final velocity
        er2 = r2/norm(r2);
        vr2 = radial_vel(mu, a, norm(e), theta2);
        
        % angular component of final velocity
        etheta2 = cross(k, er2);
        vtheta2 = angular_vel(mu, a, norm(e), theta2);
        
        % final orbit velocity vector
        v2 = vr2 * er2 + vtheta2 * etheta2;
    
    % return NaN for both velocities if no elliptical transfer
    else
        v1 = [NaN; NaN; NaN];
        v2 = [NaN; NaN; NaN];
        disp("No elliptic transfer is possible for the given time of flight")
    end
end

