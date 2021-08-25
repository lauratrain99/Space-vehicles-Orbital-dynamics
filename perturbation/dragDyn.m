function der = dragDyn(t, x, mu, Bc, w, Re)
    
    r = x(1:3);
    v = x(4:6);
    
    h = norm(r) - Re;
    
    rho  = (6*1e-10)*exp( - ( h - 175000 ) / 35500 ); 
    
    
    vRel = (v - cross(w',r));
    nvRel = norm(vRel); 
    
    rDot = v;
    vDot = -(mu/norm(r)^3)*r - 1/2*rho*nvRel^2/Bc*(vRel/nvRel);

    der = [rDot; vDot];

end
