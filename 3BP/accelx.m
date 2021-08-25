function ax = accelx (x,mustar)
% accelx computes the x component of the acceleration in 3BP
% INPUTS:
%            x, x coordinate point
%       mustar, non-dimensional 3PB parameter
% 
% OUTPUTS:
%           ax, acceleration in x direction
%
%%
    ax = -(1-mustar) ./ (x+mustar).^2 .*sign(x+mustar)...
    - mustar./(x-1+mustar).^2.*sign(x-1+mustar)...
    + x;

end

