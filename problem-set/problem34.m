% Author: Laura Train
% Date of the last update Mar 3 2021

clear;clc;

addpath ../conversions
addpath ../conversions/orbital-elem
addpath ../perturbation

%%
% choose initial COE
% COE to r0, v0
% integrate with ode45, r and v
% r and v to COE
% plot Omega(t)
% check that delta Omega is approx 1º/day

a0 = 7259;
e0 = 0;
Omega0 = 0;
inc0 = deg2rad(99);
omega0 = 0;
theta0 = 0;
J2 = 0.00108263;
mu = 3.986e+5;
ez = [0; 0; 1];
Rearth = 6371;
N_days = 14;

coe0 = [a0, e0, Omega0, inc0, omega0, theta0];

[r0, v0] = coe2rv(mu, a0, e0, Omega0, inc0, omega0, theta0);

options = odeset('RelTol', 1e-10, 'AbsTol', 1e-9);

tspan = linspace(0, 86400*N_days, 1000*N_days)';
state0 = [r0,v0];
[t, state] = ode45(@J2dyn, tspan, state0, options, mu, ez, J2, Rearth);

%% 

for i = 1:length(t)
    st.r = state(i,1:3);
    st.v = state(i,4:6);
    [coe_struct] = rv2coe(mu, st);
    a(i) = coe_struct.a;
    e(i) = coe_struct.e;
    Omega(i) = coe_struct.Omega;
    inc(i) = coe_struct.inc;
end


plot(t,Omega)
