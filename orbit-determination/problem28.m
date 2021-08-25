clc;clear;

addpath ../conversions/orbital-elem

Re = 6371;
 
r1 = [-2014.52; 4254.09; 5409.70];
r2 = [-9550.16; -1683.95; 0];
r3 = [3596.23; -7594.21; -9657.16];

A = [r1/norm(r1), r2/norm(r2), r3/norm(r3)];
det(A)
mu = 3.986e+5;

D = cross(r1,r2) + cross(r2,r3) + cross(r3,r1);
N = norm(r1)*cross(r2,r3) + norm(r2)*cross(r3,r1) + norm(r3)*cross(r1,r2);
S = (norm(r2) - norm(r3))*r1 + (norm(r3) - norm(r1))*r2 + (norm(r1) - norm(r2))*r3;

% 
% e = norm(S)/norm(D)
% p = norm(N)/norm(D)
% a = p/(1-e^2)

v2 = 1/norm(r2) * sqrt(mu/(norm(N)*norm(D))) * cross(D,r2) + sqrt(mu/(norm(N)*norm(D))) * S;

state.r = r2;
state.v = v2;

[coe] = rv2coe(mu, state)

earth_sphere('km');
hold on
plot3(r1(1),r1(2),r1(3), 'r*', ...
      r2(1),r2(2),r2(3), 'b*', ... 
      r3(1),r3(2),r3(3), 'g*', 'LineWidth',3)
orbit_coords = ellipse_coords(mu, coe.a, coe.e, deg2rad(coe.Omega), deg2rad(coe.inc), deg2rad(coe.omega));

plot3(orbit_coords(1,:), orbit_coords(2,:), orbit_coords(3,:),'r', 'LineWidth',3)
hold off
grid minor