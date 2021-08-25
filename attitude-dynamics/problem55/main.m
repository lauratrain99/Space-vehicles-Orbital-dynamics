% This script compute the inertias of a cylinder and initialise the dynamics of a gyroscopic motion  

clear;clc;

Ixx = 1500;
Iyy = Ixx;
Izz = 500;
wz0 = 1;
wy0 = 0.5774;


I = [Ixx 0 0; 0 Iyy 0; 0 0 Izz];

invI = I^-1;

w0= [0; wy0; wz0];       % body initial angular velocity

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



dHy = Izz*w0(3)*tan(nutation);

tf = 0.01;
ts = 4.712;
My = dHy/tf;


