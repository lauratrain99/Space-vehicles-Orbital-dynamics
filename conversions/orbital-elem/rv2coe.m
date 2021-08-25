function [coe] = rv2coe(mu, state)
% rv2coe converts from the state vector x = [r,v] (position and velocity)
% in ECI coords to Classical Orbit Elements. It includes nominal cases,
% equatorial orbits and circular orbits
%
% INPUT
%           mu, gravitational parameter [km^3/s]
%        state, structure containing data of the state vector with the
%        following fields
%            r: 3x1 position vector in ECI coords [km]
%            v: 3x1 velocity vector in ECI coords [km/s]
%
% OUTPUT 
%          coe, structure containing the classical orbital elements.
%          Depending on the nature of the orbit it will contain different
%          fields
%                                    nominal case
%            a: semi-major axis [km]
%            e: eccentricity
%        Omega: right ascension of the descending node [º]
%          inc: inclination [º]
%        omega: argument of the periapsis [º]
%        theta: true anomaly [º]
%                                    circular case
%            a: semi-major axis [km]
%            e: eccentricity
%        Omega: right ascension of the descending node [º]
%          inc: inclination [º]
%            u: argument of latitude [º]
%                                    equatorial case
%            a: semi-major axis [km]
%            e: eccentricity
%          inc: inclination [º]
%    omega_hat: argument of the periapsis [º]
%        theta: true anomaly [º]
%                                    circular and equatorial case
%            a: semi-major axis [km]
%            e: eccentricity
%       lambda: true longitude of the body [rad]
%          inc: inclination [rad]
%
%% 
        % Position magnitude [km]
        r  = state.r;
        r_norm = norm(r);
        ur = r/r_norm;
        
        % Velocity magnitude [km/s]
        v = state.v ;
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
        
        
        % B0 vectors
        i0 = [1;0;0];
        j0 = [0;1;0];
        k0 = [0;0;1];
        
        % B3 vectors
        k3 = h/h_norm;
        i3 = e_vec/e;
        j3 = cross(k3,i3);
        
        % line of nodes
        n = cross(k0,h)/norm(cross(k0,h));
        n_norm = norm(n);
        
        % B1 vectors
        i1 = n/n_norm;
        k1 = k0;
        j1 = cross(k1,i1);
        
        % B2 vectors
        i2 = i1;
        k2 = k3;
        j2 = cross(k2,i2);
        
        % Record a and e in the data structure
        coe.a = a;
        coe.e = e;
        
        % Compute the angular coe depending on the nature of the orbit
        if e < 1e-3 && n_norm > 1e-3
            % circular orbit
            coe = angleCOE_cir(coe, i0, k0, i1, k3, ur);
            
        elseif e > 1e-3 && n_norm < 1e-3
            % equatorial orbit
            coe = angleCOE_equa(coe, i0, k0, i3, k3, ur);
            
        elseif e < 1e-3 && n_norm < 1e-3
            % Circular and equatorial orbit
            coe = angleCOE_cirEqua(coe, i0, k0, k3, ur);
        else
            % nominal case
            coe = angleCOE_nom(coe, i0, k0, i3, i1, k3, ur);
        end
        
end