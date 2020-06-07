function r = calculate_r(x6,v,u)
    r = [0,0,0];
    r(1) = x6 - v(1);                      %for constraint x6 = 1 
    r(2) = max(max(0, -u + v(2)));    %for u_i <= 14.5 
    r(3) = max(max(0, u - v(3)));     %for u_i >= 14.5
end