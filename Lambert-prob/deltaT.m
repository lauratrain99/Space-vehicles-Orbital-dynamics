function dT = deltaT(t1, t2)
%
% deltaT obtains the delta of time between one orbital position and another
%
% INPUT:
%      t1, time from periapsis to r1 [s]
%      t2, time from periapsis to r2 [s]
%       n, mean angular rate [rad/s]
%
% OUTPUT:
%      dT, time interval from r1 to r2 [s]
%
%%
    dT = t2 - t1;

    if dT < 0
        dT = dT + 2*pi/n;
    end
    
end