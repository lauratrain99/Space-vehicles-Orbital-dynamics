function [coe] = angleCOE_cirEqua(coe, i0, k0, h, ur)
% Author: Laura Train
% Date of the last update Feb 10 2021
%
% angleCOE_cirEqua obtains the angles of the Classical Orbit Elements
% for circular and equatorial orbits
%
% INPUT
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%           i0, 3x1 unit i vector of the B0 in ECI coords
%           k0, 3x1 velocity vector in ECI coords [km/s]
%            h, 3x1 angular momentum vector in ECI coords [km^2/s]
%           ur, 3x1 unit vector in the direction of the position vector r
% OUTPUT 
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%       lambda: true longitude of the body [º]
%          inc: inclination [º]
%
%% 
        
        % RAAN [º]
        if sin(dot(i0,ur))> 0
            % Either 1st or 2nd quadrant
            coe.lambda = acos(dot(i0,ur));
        else
            % Either 3rd or 4th quadrant
            coe.lambda = -acos(dot(i0,ur));
        end
        
        % Inclination [º]
          % Only defined for 1st and 2nd quadrant
          coe.inc = acos(dot(k0,h/norm(h)));
      
end
