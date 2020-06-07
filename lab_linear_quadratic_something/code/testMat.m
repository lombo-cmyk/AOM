function res = testMat(mat, op)
% Function testing if matrix 'mat' is symmetrical and definite/semidefinite.
% 
% mat - matrix to test
% op  - function returning true if the number satisfies the condition and
%       false otherwise. Use GreaterThan(0) to test definiteness and
%       GreaterEqualThan(0) to test semidefiniteness
% res - result (true or false)

    res = false;
    
    % Test if 'mat' is symmetrical
    if ~isequal(mat, mat')
       fprintf('Matrix %s is not symmetrical', inputname(1))
       return;
    end
    
    % Test definiteness/semidefinitenessh
    for i = 1:size(mat, 1)
       D = mat(1:i, 1:i);
       if ~op(det(D))
           fprintf('Matrix %s is not definite/semidefinite', inputname(1))
           return;
       end
    end
    
    res = true;
end