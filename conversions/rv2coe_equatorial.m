function [a, e, inc, omega_hat, theta] = rv2coe_equatorial(mu, r, v)
% rv2coe_equatorial converts from the state vector x = [r,v] (position and velocity)
% in ECI coords to Classical Orbit Elements. It only covers equatorial orbits.
%
% INPUT
%           mu, gravitational parameter [km^3/s]
%            r, 3x1 position vector in ECI coords [km]
%            v, 3x1 velocity vector in ECI coords [km/s]
%
% OUTPUT 
%            a, semi-major axis [km]
%            e, eccentricity
%          inc, inclination [º]
%    omega_hat, argument of the periapsis [º]
%        theta, true anomaly [º]
%
%% 
        % Position magnitude [km]
        r_norm = norm(r);
        
        % Velocity magnitude [km/s]
        v_norm = norm(v);
        
        % Mechanical energy [km^2/s^2]
        xi = v_norm^2/2 - mu/r_norm;
        
        % Semi-major axis [km]
        a = -mu/(2*xi);
        
        % Angular momentum [km^2/s]
        h = cross(r,v);
        h_norm = norm(h);
        
        % Semilatus rectum [km]
        p = h_norm^2/mu;
        
        % Eccentricity
        e_vec = (1/mu) *(cross(v,h) - mu*r/r_norm);
        e = sqrt(1 - p/a);
        
        % Check both scalars coincide
        disp(norm(e_vec));
        disp(e);
        
        % B0 vectors
        i0 = [1;0;0];
        j0 = [0;1;0];
        k0 = [0;0;1];
        
        % B3 vectors
        k3 = h/h_norm;
        i3 = e_vec/e;
        j3 = cross(k3,i3);
        
        
        % B1 vectors
        i1 = n;
        k1 = k0;
        j1 = cross(k1,i1);
        
        % B2 vectors
        i2 = i1;
        k2 = k3;
        j2 = cross(k2,i2);
        
        % RAAN [º]
        if sin(dot(i0,e_vec))> 0
            % Either 1st or 2nd quadrant
            omega_hat = acos(dot(i0,e_vec));
        else
            % Either 3rd or 4th quadrant
            omega_hat = -acos(dot(i0,e_vec));
        end
        
        % Inclination [º]
          % Only defined for 1st and 2nd quadrant
          inc = acos(dot(k0,h));
        
        
        % True anomaly [º]
        if sin(dot(i3,r/r_norm))> 0
            % Either 1st or 2nd quadrant
            theta = acosd(dot(i3,r/r_norm));
        else
            % Either 3rd or 4th quadrant
            theta = -acosd(dot(i3,r/r_norm));
        end

end

