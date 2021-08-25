clc;
clear;
close all;

N = 100;
t = linspace(0,10,N)';
ar = t*0;
atheta = t*0 + 0.1 ;

% sqrt(2) is the escape velocity
X0 = [1;0;0;1];

[t,X]= RK4(t,X0,ar,atheta);

r = X(:,1);
theta = X(:,2);
plot(r.*cos(theta), r.*sin(theta))
axis equal

opts = optimset('Display','iter');
fmincon(@(Z) cost(t, X0, Z(1:N), Z(N+1:2*N)), [ar;atheta], [], [], [], [], [], [], ...
        @(Z) constraints(t,X0,Z(1:N), Z(N+1:2*N)), opts);
    
    
[t,X]= RK4(t,X0,ar,atheta);

r = X(:,1);
theta = X(:,2);
plot(r.*cos(theta), r.*sin(theta))
axis equal