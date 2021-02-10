function [coe] = angleCOE_equa(coe, i0, k0, i3, h, ur)
% Author: Laura Train
% Date of the last update Feb 8 2021

% angleCOE_equa obtains the angles of the Classical Orbit Elements
% for equatorial orbits
%
% INPUT
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%           i0, 3x1 unit i vector of the B0 in ECI coords
%           k0, 3x1 velocity vector in ECI coords [km/s]
%           i3, 3x1 unit i vector of the B3 in ECI coords
%            h, 3x1 angular momentum vector in ECI coords [km^2/s]
%           ur, 3x1 unit vector in the direction of the position vector r
% OUTPUT 
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%    omega_hat: true longitude of the periapsis [º]
%          inc: inclination [º]
%        theta: true anomaly [º]
%
%% 
        
        % RAAN [º]
        if sin(dot(i0,i3))> 0
            % Either 1st or 2nd quadrant
            coe.omega_hat = acos(dot(i0,i3));
        else
            % Either 3rd or 4th quadrant
            coe.omega_hat = -acos(dot(i0,i3));
        end
        
        % Inclination [º]
          % Only defined for 1st and 2nd quadrant
          coe.inc = acos(dot(k0,h));
        
        
        % True anomaly [º]
        if sin(dot(i3,r/r_norm))> 0
            % Either 1st or 2nd quadrant
            coe.theta = acosd(dot(i3,ur));
        else
            % Either 3rd or 4th quadrant
            coe.theta = -acosd(dot(i3,ur));
        end
        
        

end


