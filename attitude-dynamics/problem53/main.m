% This script compute the inertias of a cylinder and initialise the dynamics of a gyroscopic motion  

clear;clc;

M = 50;         %kg 
R = 0.25;       % m
L = 0.1;        % m

Izz = 1/2*M*R^2;
Ixx = 1/2*Izz + 1/12*M*L^2;


I = [Ixx 0 0; 0 1.9*Ixx 0; 0 0 Izz];

invI = I^-1;

w0= [0; 5; 30]*pi/180;       % body initial angular velocity

Ho  = I*w0; %Angular momentum vector in body

nutation = acos(Ho(3)/norm(Ho));% This is the initial nutation to be kept constant during the motion 

% w0_Ine = [0, w0(3)*sin(nutation)+w0(2)*cos(nutation), w0(3)*cos(nutation)-w0(2)*sin(nutation)];
% 
% w0 = w0_Ine;

Q0S = cos(nutation/2);
Q0V = sin(nutation/2)*[ 1 0 0]; % This initial attitude is assigned to consider an inertial system whose Z-Axis-Inertial is orientend 
                              % along Gamma (Angular momentum). 

Q0 = [Q0S Q0V];

nutationDeg = nutation*180/pi
psiDot = norm(Ho)/I(1,1)*180/pi
phiDot = (I(1,1) - I(3,3))/I(1,1)*w0(3)*180/pi

Mom = 10;
% dt = 5;
% 
% dHy = Izz*w0(3)*tan(nutation);
% 
% tf = 0.01;
% ts = 4.712;
% My = dHy/tf;


