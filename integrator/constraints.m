function [c, ceq] = constraints(t, X0, ar, atheta)
    
    [t,X] = RK4(t,X0, ar, atheta);
    
    % set an inequality for the control ar^2 + atheta^2 <= lim
    c = [];
    
    ceq = [X(end,3);
           X(end,4) - sqrt(1/X(end,1))];
       
    
end

