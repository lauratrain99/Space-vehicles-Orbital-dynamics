function J = cost(t, X0, ar, atheta)
% Author: Laura Train
% Date of the last update Mar 11 2021

% cost records the cost functional for orbit optimization
%
% INPUT:
%       t, Nx1 time vector
%      X0, 4x1 initial state
%      ar, radial acceleration
%  atheta, tangential acceleration
%
% OUTPUT:
%       J, cost functional
%
%%
    [~,X] = RK4(t,X0, ar, atheta);
    
    J = -X(end,1);
    
end
