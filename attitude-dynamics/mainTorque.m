% This script compute the inertias of a cylinder and initialise the dynamics of a gyroscopic motion  
%
clear all
M = 50; %kg 
R = 0.25;% m
L = 0.1; % m
%
Izz = 1/2*M*R^2
Ixx = 1/2*Izz + 1/12*M*L^2
% 
I = [Ixx 0 0; 0 Ixx 0; 0 0 Izz];
%
invI = I^-1;
%
w0= [0 0 30]*pi/180;
%
H0  = [I(1,1)*w0(1) I(2,2)*w0(2)  I(3,3)*w0(3)]; %Angular initial angular momentum vector in body
%
w0y = 5*pi/180;
dt  = 0.1; 
Mom = w0y*I(2,2)/dt
%
dH = [ 0 1 0]*Mom*dt;
Hf = H0 + dH; 
iniAng = acos(Hf(3)/norm(Hf));% This is the initial nutation to be kept constant during the motion 
%
%w0_Ine = [ 0 w0(3)*sin(iniAng)+w0(2)*cos(iniAng) w0(3)*cos(iniAng)-w0(2)*sin(iniAng)];

%w0 = w0_Ine;
%
Q0S = cos(iniAng/2);
Q0V = sin(iniAng/2)*[ 1 0 0]; % This initial attitude is assigned to consider an inertial system whose Z-Axis-Inertial is orientend 
                              % along Gamma (Angular momentum). 
%
%
Q0 = [Q0S Q0V];
%
iniAngDeg = iniAng*180/pi
psiDot = norm(Hf)/I(1,1)*180/pi
phiDot = (I(1,1) - I(3,3))/I(1,1)*w0(3)*180/pi
%
%


