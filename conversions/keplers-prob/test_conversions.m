function tests = test_conversions
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


function test_thetaE2(~)
    tol = 1e-12;
    
    % Check at 0 and pi
    assert(abs(theta2E(0,0.3)) < tol);
    assert(abs(theta2E(pi,0.3) - pi) < tol);
    
    % Check the quadrant for E = pi/2
    theta = pi/2;
    E = theta2E(theta, 0.3);
    assert(E <= pi && E >= 0);
    assert(theta >= E);
    
    % E is within pi,2*pi
    theta = 3*pi/2;
    E = theta2E(theta, 0.3);
    assert(E >= pi && E <= 2*pi);
    assert(theta <= E);
end

function test_M2E(~)
    tol = 1e-12;
    
    % Check the behaviour for M = 0, E = e*sinE
    assert(abs(M2E(0,0.3)) < tol);
    
    % Check behaviour for M = pi/2
    M = pi/2;
    E = M2E(M, 0.3);
    assert(E >= 0 && E <= pi);
    assert(E >= M);
    
    % Check behaviour for M = 3pi/2
    M = 3*pi/2;
    E = M2E(M, 0.3);
    assert(E >= pi && E <= 2*pi);
    assert(E <= M);
end


function test_E2M(~)
    tol = 1e-12;
    
    % Check the behaviour for E = 0
    assert(abs(E2M(0,0.3)) < tol);
    
    % Check behaviour for E = pi/2
    E = pi/2;
    M = E2M(E, 0.3);
    assert(M >= 0 && M <= pi);
    assert(E >= M);
    
    % Check behaviour for E = 3pi/2
    E = 3*pi/2;
    M = E2M(E, 0.3);
    assert(M >= pi && M <= 2*pi);
    assert(E <= M);
end


function test_dt2M(~)
    tol = 1e-12;
    mu = 1;
    a = 1;
    
    % Check the behaviour for dt = 0
    assert(abs(dt2M(0,mu,a)) < tol);
    
    % Check behaviour for dt = 1
    assert(abs(dt2M(1,mu,a) - 1) < tol);
    
    % Check behaviour for dt = 2
    assert(abs(dt2M(2,mu,a) - 2) < tol);
end

function test_M2dt(~)
    tol = 1e-12;
    mu = 1;
    a = 1;
    
    % Check the behaviour for M = 0
    assert(abs(M2dt(0,mu,a)) < tol);
    
    % Check behaviour for M = 1
    assert(abs(M2dt(1,mu,a) - 1) < tol);
    
    % Check behaviour for M = 2
    assert(abs(M2dt(2,mu,a) - 2) < tol);
end