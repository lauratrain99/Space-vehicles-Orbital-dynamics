function [x,err,iter] = bisection(f,xL,xR,tolerance,maxiter)
% bisection uses bisection method to solve a nonlinear equation
% INPUTS:
%             f, function to solve as a handle
%            xL, left endpoint
%            xR, right endpoint
%     tolerance, tolerance value for the bisection method
%       maxiter, maximum number of iterations
%
% OUTPUTS: 
%             x, root of f function
%           err, error in the function value for the found root
%          iter, number of iterations required to converge
%
%%
    % First evaluate the function at a and b
    fxL = f(xL) ;
    fxR = f(xR);

    % Check bisection method can be applied
    if (fxL*fxR > 0)
%       disp('Error: bisection method requires having f(xL) and f(xR) of different sign');
      x = NaN; err=NaN; iter=NaN;
      return
    elseif (xL >= xR)
%       disp('Error: bisection method requires having xL > xR');
      x = NaN; err=NaN; iter=NaN;
      return
    elseif (tolerance <= 0)
%       disp('Error: bisection method requires a tolerance > 0');
      x = NaN; err=NaN; iter=NaN;
      return
    end

    % Apply bisection mehotd
    for k = 1:maxiter
          x = (xL+xR)/2;
          fx = f(x);
          fxL = f(xL) ;
          fxR = f(xR);
          
        % Check if x is the root
        % if yes assign x, iter and err and return
        % if not, continue
        
             err = abs(fx);
          if err < tolerance
              iter = k;
              return
          end
        % detemine the endpoints a and/or b for the next iteration 

          if fx*fxL < 0
              xR = x; 
              fxR = fx;
          else
              xL = x;
              fxL = fx;
          end
          
    end
    
    % if the tolerance was not complied, assign iter the maximum iter
    % number
    if k == maxiter
        iter=maxiter;
    end
    
end
