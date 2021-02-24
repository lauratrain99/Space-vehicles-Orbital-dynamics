function [x, dx_x, it] = newton(f,df,x,tol,maxiter)
% Author: Laura Train
% Date of the last update Feb 24 2021

% newton uses the Newton-Raphson method to solve a non-linear equation
%
% INPUT:
%       f, non linear function handle
%      df, non linear function derivative handle
%       x, initial guess
%     tol, tolerance
% maxiter, maximum number of iterations
%
% OUTPUT:
%      x, solution
%   dx_x, relative error
%     it, iterations 
%
%%
    dx = 0;
    for it = 0:maxiter
        x = x + dx;
        err = f(x);
        dx = - err/df(x);
        dx_x = dx/(abs(x) + 1);
        if abs(err) < tol && abs(dx_x) < tol
            return;
        end
    end
    
    error('No convergence!')
end

