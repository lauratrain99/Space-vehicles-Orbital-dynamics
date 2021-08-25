clear;clc;

i0 = [1;0;0];
j0 = [0;1;0];
k0 = [0;0;1];

r1 = 15945.34*i0;                           % km
r2 = 12214.83899*i0 + 10249.64731*k0;       % km

% r1 = 15945.34*i0 + 15945.34*j0;
% r2 = 15945.34*i0 - 15945.34/2*j0;
mu = 3.986e+5;

et_star = 0.7;
deltaT_star = 60*60;                        % s
k = cross(r1,r2) / norm(cross(r1,r2));

% [p, e, a, deltaTheta] = Lambert_conic(et_star, r1, r2, k);
% 
% [xFE, yFE] = ellipse_coords(a, norm(e));
% 
% 
% plot(xFE,yFE)
% axis equal

%%

% chord vector
c = r2 - r1;
    
% normal vector in c direction
ic = c/norm(c);

% eccenticity projection along ic
eF = - (norm(r2) - norm(r1))/norm(c);
eTP = sqrt(1 - eF^2);

eT = linspace(-0.99,0.99,1000);
k_short = cross(r1,r2) / norm(cross(r1,r2));

for i = 1:length(eT)
    [dT_short(i), theta1_short(i), theta2_short(i), ~, e_short(:,i), eF_short(i), deltaTheta_short(i)] = Lambert_time(r1, r2, eT(i), k_short, mu);
end

k_long = - cross(r1,r2) / norm(cross(r1,r2));

for i = 1:length(eT)
    [dT_long(i), theta1_long(i), theta2_long(i), ~, e_long(:,i), eF_long(i), deltaTheta_long(i)] = Lambert_time(r1, r2, eT(i), k_long, mu);
end

for i = 1:length(eT)
    e = e_short(:,i);
    W = k_short;
    P = e/norm(e);
    Q = cross(W,P);
    
    % obtain theta1 and theta 2
    sin_theta1 = dot(r1/norm(r1),Q);
    cos_theta1 = dot(r1/norm(r1),P);
    calc_theta1_short(i) = atan2(sin_theta1, cos_theta1);
    
    sin_theta2 = dot(r2/norm(r2),Q);
    cos_theta2 = dot(r2/norm(r2),P);
    calc_theta2_short(i) = atan2(sin_theta2, cos_theta2);
    
    
    e = e_long(:,i);
    W = k_long;
    P = e/norm(e);
    Q = cross(W,P);
    
    % obtain theta1 and theta 2
    sin_theta1 = dot(r1/norm(r1),Q);
    cos_theta1 = dot(r1/norm(r1),P);
    calc_theta1_long(i) = atan2(sin_theta1, cos_theta1);
    
    sin_theta2 = dot(r2/norm(r2),Q);
    cos_theta2 = dot(r2/norm(r2),P);
    calc_theta2_long(i) = atan2(sin_theta2, cos_theta2);
    
    
    
end

figure(1)
plot(eT, dT_short, 'b', eT, dT_long, 'r')
ylim([0, 2e+4])
legend('short arc', 'long arc')


figure(2)
plot(eT, rad2deg(theta1_short), 'b', eT, rad2deg(theta2_short), 'r')
legend('theta1', 'theta2')


figure(3)
plot(eT, rad2deg(theta1_long), 'b', eT, rad2deg(theta2_long), 'r')
legend('theta1', 'theta2')
% [dT, theta1, theta2, a, e, eF] = Lambert_time(r1, r2, eT_star, k, mu);



[eT_sol, ~, ~, ~, ~, ~, g] = Lambert_solver(r1, r2, mu, k, deltaT_star);


eT = linspace(0.1, 0.99, 100);
for i = 1:length(eT)
    res(i) = g(eT(i));
end
figure(4)
plot(eT, res)

