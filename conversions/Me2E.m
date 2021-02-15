function [E, it, error, deltaE] = Me2E(Me, e, tol)
% Author: Laura Train
% Date of the last update Feb 15 2021

% Me2E obtains the eccentric anomaly from the mean anomaly in an elliptic
% case
%
% INPUT
%           Me, mean anomaly of the ellipse [deg]
%            e, eccentricity of the orbit
%          tol, tolerance for the error interval
% OUTPUT 
%            E, eccentric anomaly [deg]
%           it, number of iterations
%        error,
%
%%      
        if e > 0.95
            disp('Warning. The orbit eccentricity is closed to one. The solution might be ill-conditioned')
        end
        
        % Transfrom E to radians
        Me = deg2rad(Me);
        
        % define the function to find the root
        f = @(E) E - e*sin(E) - Me;
        f_dot = @(E) 1 - e*cos(E);
        
        
        % assume the initial guess as Me
        E(1) = Me;
        error(1) = abs(f(E(1)));
        
        % Compute second iteration
        E(2) = E(1) - error(1)/f_dot(E(1));
        error(2) = abs(f(E(2)));
        deltaE(1) = abs(E(2) - E(1))/abs(E(2));
        
        it = 2;
        
        % Compute the rest of iterations
        while (error(it) > tol) || (deltaE(it-1) > tol)
            
            E(it+1) = E(it) - f(E(it))/f_dot(E(it));
            error(it+1) = abs(f(E(it+1)));
            deltaE(it) = abs(E(it+1) - E(it))/abs(E(it+1));
            it = it + 1;
        end
        
        % Convert back to degrees
        E = rad2deg(E);
        
        
end

