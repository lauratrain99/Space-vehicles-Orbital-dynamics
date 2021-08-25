%% problem 42
m2 = 5.97e24;
m1 = 1.989e30;

mustar = m2/(m1+m2);
xL1 = getLagrangePoint (mustar, 1)
xL2 = getLagrangePoint (mustar, 2)
xL3 = getLagrangePoint (mustar, 3)

%% plot effect of mu in xL1
n = 50;

mu_star = linspace(0.001, 0.000000001, n);

xL1(n) = 0;

for i = 1:n
    xL1(i) = getLagrangePoint (mu_star(i), 1);
    xL2(i) = getLagrangePoint (mu_star(i), 2);
    xL3(i) = getLagrangePoint (mu_star(i), 3);
end

figure()
plot(mu_star, xL1, 'b')
title('$\mu*$ influcence on xL1','interpreter','latex')
xlabel('$\mu*$','interpreter','latex')
ylabel('xL1','interpreter','latex')
grid minor

figure()
plot(mu_star, xL2, 'b')
title('$\mu*$ influcence on xL2','interpreter','latex')
xlabel('$\mu*$','interpreter','latex')
ylabel('xL2','interpreter','latex')
grid minor

figure()
plot(mu_star, xL3, 'b')
title('$\mu*$ influcence on xL3','interpreter','latex')
xlabel('$\mu*$','interpreter','latex')
ylabel('xL3','interpreter','latex')
grid minor

%% problem 43
mP1  = 0.9;
mP2 = 0.09;
mP3 = 0.01;


%% problem 43

clear; close all;

muJ = 1266.87e+5;
muS = 1327120e+5;
mustar = muJ/(muS + muJ);



f = @(x)accelx(x, mustar);
df = @(x)daccelx(x, mustar);

% collinear lagrange points
xL1 = getLagrangePoint (mustar, 1)
xL2 = getLagrangePoint (mustar, 2)
xL3 = getLagrangePoint (mustar, 3)

% xL1 = 0.93;
% xL2 = 1.05;
% xL3 = -1;

% equilateral points
xL4 = 0.5 - mustar;
yL4 = sqrt(3)/2;
xL5 = 0.5 - mustar;
yL5 = -sqrt(3)/2;

UL1 = potential(xL1, 0, 0, mustar);
UL2 = potential(xL2, 0, 0, mustar);
UL3 = potential(xL3, 0, 0, mustar);

UL4 = potential(xL4, yL4, 0, mustar);
UL5 = potential(xL5, yL5, 0, mustar);

% contour plotting
x = linspace(-1.1, 1.1, 500);
y = linspace(-1.1, 1.1, 500);

[X, Y] = meshgrid(x, y);
U = potential(X, Y, X*0, mustar);

figure(2)
a = axes;
% a.CLim = [-2,-1];
% s = surface(X, Y, U);
% s.LineStyle = 'none';

% v = [UL4, UL4] - 0.0001;
% s = contour(X, Y, U, v);

v = linspace(UL1-0.01, UL4, 10);
s = contour(X, Y, U, v);

%% problem 44
% get eigs, eigenvalues and eigenvectors
% solution is sum of eigenvalues or eigenvectors
% compute C1, C2, C3, C4 equating solution to initial conditiosn
% x', y', x_dot', y_dot'
% L1, two purely imaginary, two real one positive and one negative
% select which eigenvalues to excite and which not
% C = 0 for the unstable, no need of cancelling stable eigenvalue
% compare analytical solution and ode45 solution
