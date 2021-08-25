function dax = daccelx (x,mustar)
% accelx computes the x component of the  derivative of the
% acceleration in 3BP
% INPUTS:
%            x, x coordinate
%       mustar, non-dimensional 3PB parameter
% 
% OUTPUTS:
%          dax, derivative of the acceleration in x direction
%
%%
    dax = 2*(1-mustar) / (x+mustar)^3.*sign(x+mustar)...
    + 2*mustar/(x-1+mustar)^3.*sign(x-1+mustar)...
    + 1;

end

