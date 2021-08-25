function tests = test_dynamics
    clc;
    tests = functiontests(localfunctions);
end

function test_dXdt(~)
    % X = [r, theta, u ,v]
    
    % Initial state for circular motion
    X0 = [1; 0; 0; 1];
    
    % Get differentiation
    dXdt = dynamics(X0, 0, 0); 
    
    assert(abs(dXdt(1)) < eps);
    assert(abs(dXdt(2) - 1) < eps);
    assert(abs(dXdt(3)) < eps);
    assert(abs(dXdt(4)) < eps);
    

end
    
function test_sizeofX(~)
    
    % Give conditions for the integration
    N = 100;
    t = linspace(0,10,N)';
    ar = t*0;
    atheta = t*0;
    X0 = [1; 0; 0; 1];
    
    % apply the RK4
    [t,X] = RK4(t,X0,ar,atheta);
    
    assert(abs(X(1,1) - 1) < eps);
    assert(abs(X(1,4) - 1) < eps);
    
    assert(abs(X(1,end) - 1) < eps);
    assert(abs(X(1,end) - 1) < eps);
    
    assert(length(t) == N);
    
    
    
    
end