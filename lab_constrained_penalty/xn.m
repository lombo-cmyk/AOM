function x = xn(u,n,x0)
% Przypisanie warunku poczatkowego 3 
x = zeros (1 , n+1);
x(1) = x0; 
for i = 2:n+1 
    x( i ) = 2*x(i-1) + u(i-1); 
end
end
