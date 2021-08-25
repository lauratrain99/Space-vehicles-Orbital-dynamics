clear;clc;

i0 = [1; 0; 0];
j0 = [0; 1; 0];
k0 = [0; 0; 1];

r1 = 15945.34*i0;
r2 = 12214.83899*i0 + 10249.64731*k0;

deltaT = 76*60;

mu = 3.986e5;
k = -cross(r1,r2)/norm(cross(r1,r2));

[v1, v2] = Lambert(r1, r2, k, deltaT, mu)