% This script computes the Life Time of a Satellite via Cowell method 
%
clear all
%
rad = pi/180;
deg = 180/pi;
%
Re = 6378.144*1e+3; % m Earth Radius at the Equator
mu = 398602*1e+9;
wEarth = [ 0 0 2*pi/86164];
%
Bc = 50; % Kg/m2
hIni = 300*1e+3; % m
%
rIni = Re + hIni; 
vIni = sqrt(mu/rIni); % Velocity on circular orbit m/s 
period = 2*pi*sqrt(rIni^3/mu); 
%
rVec = [rIni 0 0];
vVec = [ 0   vIni 0];
%
iniState = [rVec vVec];
%
options = odeset('Events',@hFinal, 'RelTol',1e-9,'AbsTol',1e-8); %This  
% phase is terminated once the integrator detect a zero crossing final
% altitude 
%
[t,y] = ode45(@dragDyn,linspace(0, 1*86400,1000), iniState, options, mu, Bc, wEarth, Re);  
%
for ii=1:length(t) 
    hVec(ii) = norm(y(ii,1:3)) - Re;
    %
    [e]= pvecle(y(ii,:), mu);
    saxi(ii) = e(1);
    ecc(ii)  = e(2);
    wPer(ii) = e(5)*deg;
    trueA(ii) = e(6)*deg;
    %
end
%
figure
plot(t/86400, hVec/1000) 
set(gca,'FontSize', 14) 
xlabel('Time [days]', 'FontSize', 14)
ylabel('Altitude [km]', 'FontSize', 14)
grid on 

figure
plot(t/period, hVec/1000) 
set(gca,'FontSize', 14) 
xlabel('Orbits [#]', 'FontSize', 14)
ylabel('Altitude [km]', 'FontSize', 14)
grid on 
%
figure
subplot(2,1,1)
plot(t/period, saxi/1000)
grid on
set(gca,'FontSize', 14) 
ylabel('Semi-mayor axis [km]', 'FontSize', 14)
xlabel('Orbits [#]', 'FontSize', 14)
%
subplot(2,1,2)
plot(t/period, ecc) 
set(gca,'FontSize', 14) 
ylabel('Eccentricity [ ]', 'FontSize', 14)
xlabel('Orbits [#]', 'FontSize', 14)
grid on
%

function der = dragDyn(t, x, mu, Bc, w, Re)
% 
r = x(1:3);
v = x(4:end);

rho0 = 6e-10; 
h0 = 175000;
H = 35500;

h = norm(r) - Re;
rho = rho0 * exp( -(h - h0)/H);

vRel = v - cross(w,r)';

D = - 1/2 * rho * norm(vRel)^2 / Bc * vRel; 
rDot = v;
vDot = -mu/norm(rDot)^3 * r + D;

der = [rDot; vDot];


%
end


function [h, isterminal, direction] = hFinal(t, X, mu, Bc, wEarth, Re)
%
h   = (norm(X(1:3)) - Re);
%
isterminal = 1;
%
direction  = 0;
%
end


