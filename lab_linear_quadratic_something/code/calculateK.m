function K = calculateK(A, B, Q, R, F, N)
% Function calculating all K matrices

    K{N+1} = F;
    for i = N:-1:1
        K{i} = A'*(K{i+1} - K{i+1}*B*(R + B'*K{i+1}*B)^(-1)*B'*K{i+1})*A + Q;
        if ~isequal(K{i}, K{i}')
            K{i} = (K{i} + K{i}')/2;
        end
    end
end