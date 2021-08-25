
function tests = test_3BP
    tests = functiontests(localfunctions);
end


function test_accelx(~)
    clear;clc;
    my.accelx = accelx(1, 0.5);
    reference.accelx = -1.222222222222222;
    tolerance = 1e-10;
    assert(abs(my.accelx - reference.accelx) < tolerance);
end


function test_daccelx(~)
    clear;clc;
    my.daccelx = accelx(1, 0.5);
    reference.daccelx = -9.29629629629;
    tolerance = 1e-8;
    assert(abs(my.daccelx - reference.daccelx) < tolerance);
end
