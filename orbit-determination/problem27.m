clear;clc;

rho = 2793.1;
rho_dot = 2.9453;
beta = deg2rad(78.20);
beta_dot = deg2rad(-0.0984);
epsilon = deg2rad(25.80);
epsilon_dot = deg2rad(-0.1075);

addpath ../conversions/orbital-elem

mu = 3.986e+5;
lat = deg2rad(40.3320);
long = deg2rad(-3.7687);
h = 0.6;
Re = 6371;

R_SEZ2ECEF = [cos(long)*sin(lat), - sin(long), cos(long)*cos(lat);
              sin(long)*sin(lat), cos(long), sin(long)*cos(lat);
              -cos(lat), 0, sin(lat)];
Omega = 2*pi/86164;

t = 2*60*60;
R_ECEF2ECI = [cos(Omega*t), -sin(Omega*t), 0;
              sin(Omega*t), cos(Omega*t), 0;
              0, 0, 1];
          
i0 = [1; 0; 0];
j0 = [0; 1; 0];
k0 = [0; 0; 1];

% expressed in SEZ
r2p_SEZ = rho*[-cos(epsilon)*cos(beta); cos(epsilon)*sin(beta); sin(epsilon)];
v2p_SEZ = [-rho_dot*cos(epsilon)*cos(beta) + rho*epsilon_dot*sin(epsilon)*cos(beta) ...
           + rho*beta_dot*cos(epsilon)*sin(beta);
           rho_dot*cos(epsilon)*sin(beta) - rho*epsilon_dot*sin(epsilon)*sin(beta) ...
           + rho*beta_dot*cos(epsilon)*cos(beta);
           rho_dot*sin(epsilon) + rho*epsilon_dot*cos(epsilon)];
       
% change it to ECEF
r2p_ECEF = R_SEZ2ECEF * r2p_SEZ;
v2p_ECEF = R_SEZ2ECEF * v2p_SEZ;

% change it to ECI
r2p_ECI  = R_ECEF2ECI * r2p_ECEF;
v2p_ECI = R_ECEF2ECI * v2p_ECEF;

% expressed in ECEF
r1s_ECEF = (Re + h) * [cos(lat)*cos(long); cos(lat)*sin(long); sin(lat)];

% change it to ECI
r1s_ECI = R_ECEF2ECI * r1s_ECEF;

r0p = r1s_ECI + r2p_ECI;
v0p = v2p_ECI + cross(Omega*k0, r0p);

state.r = r0p; 
state.v = v0p;
[coe] = rv2coe(mu, state)



