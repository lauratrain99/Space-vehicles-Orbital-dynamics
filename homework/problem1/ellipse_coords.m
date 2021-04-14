function [r] = ellipse_coords(mu, a, e, Omega, inc, omega)
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
    
%     b = a*sqrt(1 - e^2);
%     p = a*(1 - e^2);
%     r = p ./ (1 + e*cos(theta));
%     
%     x_ = r.*cos(theta);
%     y_ = r.*sin(theta);
%     z_ = 0*theta;
%     
%     R1 = [cos(Omega), -sin(Omega), 0; ...
%          sin(Omega),  cos(Omega), 0; ...
%          0,  0, 1];
%      
%     R2 = [1, 0, 0; ...
%           0, cos(inc), -sin(inc); ...
%           0, sin(inc), cos(inc)];
%       
%     R3 = [cos(omega), -sin(omega), 0; ...
%          sin(omega),  cos(omega), 0; ...
%          0,  0, 1];
%      
%     for i = 1:length(theta)
%         coords = R3 * R2 * R1 * [x_(i); y_(i); z_(i)];
%         x(i) = coords(1);
%         y(i) = coords(2);
%         z(i) = coords(3);
%     end

r = zeros(3,length(theta));
for i = 1:length(theta)
    r(:,i) = coe2rv(mu, a, e, Omega, inc, omega, theta(i));
end
    
    
   
    
    
    
end
