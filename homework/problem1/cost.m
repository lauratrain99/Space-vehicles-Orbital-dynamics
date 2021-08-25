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
%            DV, delta velocity [km/s]
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
    
    % data of the problem
    muE = 3.986e+5;                      % mu Earth [km^3/s^2]   
    Rearth = 6371;                       % mean radius of Earth[km]
    h = 2000;                            % altitude [km]
    
    % ECI basis vectors
    i0 = [1;0;0];
    j0 = [0;1;0];
    k0 = [0;0;1];
    
    % initial point data
    a1 = Rearth + h;                     % semi-major axis [km]
    e1 = 0;                              % eccentricity
    Omega1 = 0;                          % RAAN [rad]
    inc1 = 0;                            % inclination [rad]
    omega1 = 0;                          % argument of the periapsis [rad]

    % compute initial position and initial orbit velocity
    [r1, v0] = coe2rv(muE, a1, e1, Omega1, inc1, omega1, theta1);
    
    % final orbit classical orbital parameters
    a2 = 30000;                                 % semi-major axis [km]
    e2 = 0.1;                                   % eccentricity
    Omega2 = deg2rad(210);                      % RAAN [rad]
    inc2 = deg2rad(25);                         % inclination [rad]
    omega2 = deg2rad(36);                       % argument of the periapsis [rad]

    % final orbit position and velocity
    [r2, vF] = coe2rv(muE, a2, e2, Omega2, inc2, omega2, theta2);

    % set perpendicular vectors for short arc and long arc transfers
    k_short = cross(r1,v0)/norm(cross(r1,v0));
    k_long = -cross(r1,v0)/norm(cross(r1,v0));
     
    
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
    DV = DV1 + DV2;


end

