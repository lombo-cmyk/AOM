function [Jv, x, J] = calculate_penalty(x0 , u, n, v, t)
x = zeros (1, n);
x(1) = x0; 
for i = 2:n 
    x(i) = 2*x(i-1) + u(i-1); 
end
J = sum(x.^2 + 2*u.^2);
R_1 = 0.5 * norm(x(6) - v(1))^2; %v(1) corresponds to x_6, etc
R_2 = sum(sum((-u + v(2)).* max(0, -u + v(2)))) ; 
R_3 = sum(sum((u - v(3)).* max(0, u - v(3)))) ; 
Jv = J + t*(R_1 + R_2 + R_3);
end