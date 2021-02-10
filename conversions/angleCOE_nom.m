function [coe] = angleCOE_nom(coe, i0, k0, i3, n, h, ur)
% Author: Laura Train
% Date of the last update Feb 10 2021

% angleCOE_nom obtains the angles of the Classical Orbit Elements
% for nominal orbits
%
% INPUT
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%           i0, 3x1 unit i vector of the B0, ECI coords
%           k0, 3x1 velocity vector in ECI coords [km/s]
%           i3, 3x1 unit i vector of the B3 in ECI coords
%            n, 3x1 line of nodes in ECI coords
%            h, 3x1 angular momentum vector in ECI coords [km^2/s]
%           ur, 3x1 unit vector in the direction of the position vector r
% OUTPUT 
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%        Omega: right ascension of the descending node [º]
%          inc: inclination [º]
%        omega: argument of the periapsis [º]
%        theta: true anomaly [º]
%
%% 
        
        % RAAN [º]
        if sin(dot(i0,n))> 0
            % Either 1st or 2nd quadrant
            coe.Omega = acos(dot(i0,n));
        else
            % Either 3rd or 4th quadrant
            coe.Omega = -acos(dot(i0,n));
        end
        
        % Inclination [º]
          % Only defined for 1st and 2nd quadrant
          coe.inc = acos(dot(k0,h/norm(h)));
        
        
        % Argument of the periapsis [º]
        if sin(dot(n,i3))> 0
            % Either 1st or 2nd quadrant
            coe.omega = acosd(dot(n,i3));
        else
            % Either 3rd or 4th quadrant
            coe.omega = -acosd(dot(n,i3));
        end
        
        % True anomaly [º]
        if sin(dot(i3,ur))> 0
            % Either 1st or 2nd quadrant
            coe.theta = acosd(dot(i3,ur));
        else
            % Either 3rd or 4th quadrant
            coe.theta = -acosd(dot(i3,ur));
        end
        
        

end

