function op = GreaterThanEqual(val)
% Function returning pointer to function determining if its argument is
% greater than or equal 'val'.

    op = @(x) x >= val; 
end