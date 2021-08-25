function [ddUddx, ddUdxdy, ddUdxdz, ddUddy, ddUdydz, ddUddz ] = d2potential(x,y,z,mu_star)
    rho1 = sqrt((mu_star + x).^2 + y.^2 + z.^2);
    rho2 = sqrt((1 - mu_star - x).^2 + y.^2 + z.^2);

    ddUddx = -3 * (1 - mu_star)/rho1.^5 * (x + mu_star)*y - 3*mu_star/rho2.^5 * (1 - mu_star - x).^2 ;
end

