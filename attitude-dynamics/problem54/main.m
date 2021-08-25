clear;clc;


t = linspace(0,40,500);

m = 50;
R = 0.25;
L = 0.1;

Iz = 1/2 * m * R^2;
Ix = 1/2 * Iz + 1/12 * m * L^2;
Iy = Ix;


IGs = [4000, 0, 0; 0, 7500, 0; 0, 0, 8500];
IGr = [50, 0, 0; 0, 50, 0; 0, 0, 100];

wrs0 = deg2rad([0; 0; 0]);
ws00 = [0; 0; 0];
theta0 = 30*pi/180;
q0 = [cos(theta0/2); sin(theta0/2); 0; 0];

state0 = [wrs0; ws00; q0]; 
options = odeset('RelTol',1e-7,'AbsTol',1e-8);
[t, state] = ode45(@dynamics, t, state0, options, IGs, IGr);

wrs = state(:,1:3);
ws0 = state(:,4:6);
q = state(:,7:10);

%%
    for i = 1:length(t)
        [psi(i), theta(i), phi(i)] = quat2angle(q(i,:), 'ZXZ');
    end
    
%%
figure(1)
plot(t, wrs(:,1), 'b', t, wrs(:,2), 'r', t, wrs(:,3), 'g')
legend('wrx_b','wry_b','wrz_b')

figure(2)
plot(t, ws0(:,1), 'b', t, ws0(:,2), 'r', t, ws0(:,3), 'g')
legend('wx_b','wy_b','wz_b')

figure(3)
plot(t, q(:,1), 'b', t, q(:,2), 'r', t, q(:,3), 'g', t, q(:,4), 'k')
legend('q0','q1','q2','q3')

psi = rad2deg(psi);
theta = rad2deg(theta);
phi = rad2deg(phi); 
figure(4)
plot(t, psi, 'b', t, theta, 'r', t, phi, 'g')
legend('precession','nutation','spin')