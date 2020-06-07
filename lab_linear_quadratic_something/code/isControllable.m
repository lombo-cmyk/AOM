function res = isControllable(A, B)
% Function determining if system described by matrices A and B is
% controllable.

    n = size(A, 1);
    S = [];
    
    for i = 0:n-1
        S = [S, A^i*B];
    end
    
    if rank(S) == n
        res = true;
    else
        res = false;
    end
end