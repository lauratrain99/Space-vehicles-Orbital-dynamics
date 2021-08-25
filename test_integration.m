function tests = test_integration
    clc;
    tests = functiontests(localfunctions);
end

function test_call_and_plot(~)

%fmincon() function constraint with 

% params
    muE = 398600e+9;
    P = 2000;
    
    N = 200;
    t = linspace(0,100000,200);
    
    % M, r, v
    X0 = [1000; 8000e+3; 0; 0;  sqrt(muE/8000e+3)];
    
    Fxi = ones(N,1);
    Fyi = ones(N,1);
    
    [t,X] = integrate_trajectory(Fxi, Fyi, t, X0, muE, P);
    
    M = X(:,1);
    r = X(:,2:3);
    v = X(:,4:5);
    
    plot(r(:,1),r(:,2))
end
    
    
