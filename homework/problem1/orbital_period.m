function [period] = orbital_period(a, mu)
    
    period = 2*pi*sqrt(a^3/mu);
end

