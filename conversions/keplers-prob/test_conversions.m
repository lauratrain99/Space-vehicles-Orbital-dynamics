function tests = test_conversions
    clc;
    tests = functiontests(localfunctions);
end

function test_E2theta(~)
    tol = 1e-12;
    assert(abs(E2theta(0,0.3)) < tol);
    assert(abs(E2theta(pi,0.3) - pi) < tol);
    
    % E is within 0,pi
    E = pi/2;
    theta = E2theta(E, 0.3);
    assert(theta <= pi && theta >= 0);
    assert(theta >= E);
    
    % E is within pi,2*pi
    E = 3*pi/2;
    theta = E2theta(E, 0.3);
    assert(theta >= pi && theta <= 2*pi);
    assert(theta <= E);
end
