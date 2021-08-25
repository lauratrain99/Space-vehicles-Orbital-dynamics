function [e]= pvecle(s,xmu)


      [n,m] = size( s );
      
      if m == 1
          s = s';
          n = 1;
      end

      e = zeros( n , 6 );
      u = zeros( n , 1 );
      % kinetic moment
      c1 = s(:,2).*s(:,6)-s(:,3).*s(:,5);
      c2 = s(:,3).*s(:,4)-s(:,1).*s(:,6);
      c3 = s(:,1).*s(:,5)-s(:,2).*s(:,4);
      
      % Modulus of kinetic moment
      cc12 = c1.*c1+c2.*c2;
      cc = cc12 + c3.*c3;
      c = sqrt(cc);
      
      % Quadratic modulus of the velocity
      v02 = s(:,4).^2+s(:,5).^2+s(:,6).^2;
      
      r0v0 = s(:,1).*s(:,4)+s(:,2).*s(:,5)+s(:,3).*s(:,6);
      
      % Modulus of position
      r02 = s(:,1).^2+s(:,2).^2+s(:,3).^2;      
      r0 = sqrt(r02);
      
      x = r0.*v02/xmu;
      cx = cc/xmu;
      ste = r0v0.*c./(r0*xmu);
      cte = cx./r0-1.d0;
      e(:,1) = r0./(2.d0-x);
      e(:,2) = sqrt(ste.*ste+cte.*cte);
      e(:,3) = atan2(sqrt(cc12),c3);

      
      u(:) = atan2(s(:,2),s(:,1)).*sign(c3);
      i = find(cc12 > cc*eps);
      u(i) = atan2(c.*s(:,3),s(:,2).*c1-s(:,1).*c2);
      e(i,4) = atan2 (c1,-c2);  

      e(:,6)  = u;
      ii = find(e(:,2) > eps);
      e(ii,6) = atan2(ste,cte);
      e(ii,5) = u-e(ii,6);

      e(:,4) = modulo(e(:,4));

      e(:,5) = modulo(e(:,5));


      if m == 1
          e = e';
      end
      
return %-----------------------------------------------------------------[MAIN FUNCTION]%

