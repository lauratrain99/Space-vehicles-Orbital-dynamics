function [DV] = cost(theta1,theta2,tf,tolerance,maxiter)
% cost obtains the delta velocity needed for a maneuver of certain time
% INPUTS:
%        theta1, true anomaly of the initial orbit [rad]
%        theta2, true anomaly of the final orbit [rad]
%            tf, time of the transfer [s]
%     tolerance, tolerance value for the bisection method
%       maxiter, maximum number of iterations
%
% OUTPUTS: 
%            DV, delta velocity [m/s]
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
    
    % gravitational parameter
    muE = 3.986e+5;                             % mu Earth [km^3/s^2]   
    
    % ECI basis vectors
    i0 = [1;0;0];
    j0 = [0;1;0];
    k0 = [0;0;1];
    
    % initial orbit position
    h = 2000;
    Re = 6371;
    R0 = h+Re;
    r1 = R0*(cos(theta1)*i0 + sin(theta1)*j0);
    
    % initial orbit circular velocity
    v0 = sqrt(muE/R0)*(-sin(theta1)*i0 + cos(theta1)*j0);
    
    % final orbit classical orbital parameters
    a2 = 30000;                                 % semi-major axis [km]
    e2 = 0.1;                                   % eccentricity
    Omega2 = deg2rad(210);                      % RAAN [rad]
    inc2 = deg2rad(25);                         % inclination [rad]
    omega2 = deg2rad(36);                       % argument of the periapsis [rad]

    % final orbit position and velocity
    [r2, vF] = coe2rv(muE, a2, e2, Omega2, inc2, omega2, theta2);

    % set perpendicular vectors for short arc and long arc transfers
    k_short = cross(r1,r2)/norm(r1.*r2);
    k_long = -cross(r1,r2)/norm(r1.*r2);
    
    % compute solution for short arc
    [v1_short,v2short] = Lambert(r1,r2,k_short,tf,muE,tolerance,maxiter);
    
    % compute solution for long arc
    [v1long,v2long] = Lambert(r1,r2,k_long,tf,muE,tolerance,maxiter);

    % choose short or long arc solution
    if dot(v1_short,v0) >= 0
        v1 = v1_short;
        v2 = v2short;
    else
        v1 = v1long;
        v2 = v2long;
    end
    
    % deltaV of the first firing
    DV1 = norm(v1-v0);
    
    % deltaV of the second firing
    DV2 = norm(vF-v2);
    
    % total deltaV
    DV = abs(DV1) + abs(DV2);


end

