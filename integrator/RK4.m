function [tvec,X] = RK4(tvec, X0, ar, atheta)
% Author: Laura Train
% Date of the last update Mar 11 2021

% RK4 performs a Runge Kutta 4 integration
%
% INPUT:
%    tvec, Nx1 time vector
%      X0, 4x1 initial state vector
%      ar, radial acceleration
%  atheta, tangential acceleration
%
% OUTPUT:
%    tvec, Nx1 time vector
%       X, Nx4 integrated state vector
%
%%
    % Number of points for the integration
    N = length(tvec);
    
    % Make a column vector
    tvec = tvec(:);
    
    % Preallocate the matrix for the states
    X = zeros(N,length(X0));        % X(N,4) = 0; alternative preallocation
    
    % Record the initial value
    X(1,:) = X0;
    
    % Interval of time 
    dt = tvec(2) - tvec(1);
    
    for i = 1:N-1
        % Average each step radial acceleration
        ar_avg = (ar(i) + ar(i+1))/2;
        
        % Average each step tangential acceleration
        atheta_avg = (atheta(i) + atheta(i+1))/2;
        
        % Compute intermediate steps
        K1 = dynamics(X(i,:), ar(i), atheta(i));
        K2 = dynamics(X(i,:) + K1*dt/2, ar_avg, atheta_avg);
        K3 = dynamics(X(i,:) + K2*dt/2, ar_avg, atheta_avg);
        K4 = dynamics(X(i,:) + K3*dt, ar(i+1), atheta(i+1));
        
        % Compute the next iteration
        X(i+1,:) = X(i,:) + dt/6*(K1 + 2*K2 + 2*K3 + K4);
    end
end

