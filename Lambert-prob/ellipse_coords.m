function [x, y] = ellipse_coords(a, e)
%
% draw_ellipse obtains the x and y coordinates of an ellipse
% INPUTS:
%           a, semi-major axis
%           e, eccentricity
% OUTPUTS:
%           x, 360x1 vector of x coordinates
%           y, 360x1 vector of y coordinates
%
%%
    theta = linspace(0, 2*pi, 360);
    
    b = a*sqrt(1 - e^2);
    
    x = a*cos(theta);
    y = b*sin(theta);
    
end
