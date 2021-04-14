function [coe] = angleCOE_cir(coe, i0, k0, i1, k3, ur)
% Author: Laura Train
% Date of the last update Feb 10 2021

% angleCOE_cir obtains the angles of the Classical Orbit Elements
% for circular orbits
%
% INPUT
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%           i0, 3x1 unit i vector of the B0, ECI coords
%           k0, 3x1 velocity vector in ECI coords [km/s]
%           i1, 3x1 unit i vector of the B1, ECI coords
%           k3, 3x1 unit k vector of the B3 in ECI coords [km^2/s]
%           ur, 3x1 unit vector in the direction of the position vector r
% OUTPUT 
%          coe, data structure containing the fields
%            a: semi-major axis [km]
%            e: eccentricity
%        Omega: right ascension of the descending node [º]
%          inc: inclination [º]
%            u, argument of latitude [º]
%
%% 
        
        % RAAN [º]
        if sin(dot(i0,i1))> 0
            % Either 1st or 2nd quadrant
            coe.Omega = acos(dot(i0,i1));
        else
            % Either 3rd or 4th quadrant
            coe.Omega = -acos(dot(i0,i1));
        end
        
        % Inclination [º]
          % Only defined for 1st and 2nd quadrant
          coe.inc = acos(dot(k0,k3));
        
        
        % Argument of the periapsis [º]
        if sin(dot(i1,ur))> 0
            % Either 1st or 2nd quadrant
            coe.u = acosd(dot(i1,ur));
        else
            % Either 3rd or 4th quadrant
            coe.u = -acosd(dot(i1,ur));
        end
        
        

end

