function der = cowell_nopert(t, x, mu)
    
    r = x(1:3);
    v = x(4:6);
    
    ap = [0; 0; 0];
    
    rDot = v;
    vDot = -(mu/norm(r)^3)*r - ap;

    der = [rDot; vDot];

end


