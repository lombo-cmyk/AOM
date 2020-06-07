function op = GreaterThan(val)
% Function returning pointer to function determining if its argument is
% greater than 'val'.

    op = @(x) x > val; 
end