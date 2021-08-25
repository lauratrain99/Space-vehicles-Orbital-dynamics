function [dUdx, dUdy, dUdz] = dpotential(x,y,z,mu_star)
    rho1 = sqrt((mu_star + x).^2 + y.^2 + z.^2);
    rho2 = sqrt((1 - mu_star - x).^2 + y.^2 + z.^2);

    dUdx = (1-mu_star)/rho1.^3 * (mu_star+ x) - mu_star/rho2.^3 * (1 - mu_star - x) - x;
    dUdy = (1-mu_star)/rho1.^3 * y + mu_star/rho2.^3 * y - y;
    dUdz = (1-mu_star)/rho1.^3 * z + mu_star/rho2.^3 * z;
end

