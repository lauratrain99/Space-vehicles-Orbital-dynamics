% % Test driven design
% muE = 3.986e+5;             % km^3/s^2
% r = 7000;                   % km
% v = 12;
% 
% energy = v^2/2 - muE/r;
% ve = sqrt(2*muE/r);

% TEST DRIVEN APPROACH
%{
    1. Do not write your code! yet
    2. First, specify what your function does! In the form of tests
    3. Only then, code your function!
%}

function tests = test_mycode
    clc;
    tests = functiontests(localfunctions);
end


function tests_escape_velocity_rzero(~)
    assert(escape_velocity(1,1) == sqrt(2));
    assert(escape_velocity(1,2) == 1);
end

function tests_escape_velocity_norma12(~)
   tolerance = 1e-8;
   assert(abs(escape_velocity(1,2) - 1) < tolerance)
end
