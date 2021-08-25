
clear;clc;close all;

rad = pi/180;
deg = 180/pi;

Re = 6378.144;             % Earth Radius at the Equator
mu = 3.986e5;
wEarth = [ 0 0 2*pi/86164];

a0 = 7200;
e0 = 0.05;
inc0 = deg2rad(30);
omega0 = deg2rad(50);
Omega0 = deg2rad(45);
theta0 = deg2rad(100);

[r0, v0] = coe2rv(mu, a0, e0, Omega0, inc0, omega0, theta0);

period = 2*pi*sqrt(a0^3/mu); 


iniState = [r0 v0];
% This phase is terminated once the integrator detect a zero crossing final
% altitude 
options = odeset('RelTol',1e-9,'AbsTol',1e-8); 

[t,y] = ode45(@cowell_nopert,linspace(0, 1*86400,1000), iniState, options, mu);  

for ii=1:length(t) 
    hVec(ii) = norm(y(ii,1:3)) - Re;
    
    [e]= pvecle(y(ii,:), mu);
    saxi(ii) = e(1);
    ecc(ii)  = e(2);
    wPer(ii) = e(5)*deg;
    trueA(ii) = e(6)*deg;
    
end


figure
subplot(2,1,1)
plot(t/period, saxi/1000)
grid on
set(gca,'FontSize', 14) 
ylabel('Semi-mayor axis [km]', 'FontSize', 14)
xlabel('Orbits [#]', 'FontSize', 14)

subplot(2,1,2)
plot(t/period, ecc) 
set(gca,'FontSize', 14) 
ylabel('Eccentricity [ ]', 'FontSize', 14)
xlabel('Orbits [#]', 'FontSize', 14)
grid on

