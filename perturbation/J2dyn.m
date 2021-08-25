function der = J2dyn(t, x, mu, ez, J2, Rearth)
%
r = x(1:3);
v = x(4:6);

er = r/norm(r);

f2 = -3/2 * J2 * mu * Rearth^2 / norm(r)^4 *( (1 - 5 * dot(er, ez)^2) * er + 2 * dot(er,ez) * ez);
rDot = v;
vDot = -(mu/norm(r)^3)*r + f2;

der = [rDot; vDot];

end
