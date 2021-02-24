


function tests = test_newton
    clc;
    tests = functiontests(localfunctions);
end

function test_linear(~)
    f = @(x) x;
    df = @(x) 1;
    x0 = 1;
    maxiter = 100;
    tol = 1e-8;
    [x, dx_x, iter] = newton(f,df,x0,tol,maxiter);
    assert(abs(x) < tol);
    assert(iter == 1);
end

function test_quadratic_positive(~)
    clear;
    f = @(x) x^2-1;
    df = @(x) 2*x;
    x0 = 1.1;
    maxiter = 100;
    tol = 1e-8;
    [x, dx_x, iter] = newton(f,df,x0,tol,maxiter);
    assert(abs(x-1) < tol );
end

function test_quadratic_negative(~)
    clear;
    f = @(x) x^2-1;
    df = @(x) 2*x;
    x0 = -1.1;
    maxiter = 100;
    tol = 1e-8;
    [x, dx_x, iter] = newton(f,df,x0,tol,maxiter);
    assert(abs(x+1) < tol );
end