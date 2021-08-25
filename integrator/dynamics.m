function xdot = dynamics(X, ar, atheta)
% Author: Laura Train
% Date of the last update Mar 11 2021

% dynamics contains the differential equations for the 2BP with
% propulsion system
%
% INPUT:
%       X, 4x1 state vector
%      ar, radial acceleration
%  atheta, tangential acceleration
%
% OUTPUT:
%   xdot, 4x1 state vector derivative
%
%%
    
    xdot(1) = X(3);
    xdot(2) = X(4)/X(1);
    xdot(3) = X(4)^2/X(1) - 1/X(1)^2 + ar;
    xdot(4) = -X(3)*X(4)/X(1) + atheta;
    
end