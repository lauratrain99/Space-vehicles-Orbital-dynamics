function [U] = potential(x,y,z,mu_star)
    rho1 = sqrt((mu_star + x).^2 + y.^2 + z.^2);
    rho2 = sqrt((1 - mu_star - x).^2 + y.^2 + z.^2);
    U = - (1 - mu_star)./rho1 - mu_star./rho2 - 1/2 * (x.^2 + y.^2);
end

