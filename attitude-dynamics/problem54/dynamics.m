function dX_dt = dynamics(t, X, IGr, IGs)


    wrs = X(1:3);
    ws0 = X(4:6);
    q = X(7:10);
    
    if t > 0 && t < 5
        Mr = [0; 0; -200];
    else
        Mr = [0; 0; 0];
    end
    
    
    wrs_dot = IGr^(-1) * (Mr - cross(wrs, IGr*wrs));

    ws0_dot = (IGs + IGr)^(-1) * (-cross(ws0,IGs*ws0) ...
    - IGr * (wrs_dot + cross(ws0,wrs)) - cross((ws0 + wrs), IGr*(ws0 + wrs)) );

    q_dot = 1/2 * quatmultiply(q', [0, ws0(1), ws0(2), ws0(3)])';
    
    
    dX_dt = [wrs_dot; ws0_dot; q_dot];

end


