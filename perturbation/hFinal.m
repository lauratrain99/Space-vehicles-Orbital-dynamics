function [h, isterminal, direction] = hFinal(t, X, mu, Bc, wEarth, Re)

    h   = (norm(X(1:3)) - Re);

    isterminal = 1;

    direction  = 0;

end