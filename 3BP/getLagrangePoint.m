function xL = getLagrangePoint (mustar, point)
% getxL1 computes the x component of L1 Lagrange point
% INPUTS:
%       mustar, non-dimensional 3PB parameter
% 
% OUTPUTS:
%          xL1, x component of L1 Lagrange point
%
%%
    if point == 1
        guess = 0.9;
    elseif point == 2
        guess = 1.01;
    elseif point == 3
        guess = -1;
    else
        error('The point should be 1, 2 or 3')
    end
    
    % function to zero
    f = @(x)accelx(x,mustar);
    
    % derivative of the function
    df = @(x)daccelx(x,mustar);
	
    % apply newton method to solve the non-linear equation.
    xL = newton(f,df,guess);
    
end

