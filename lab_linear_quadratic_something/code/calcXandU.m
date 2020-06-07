function [x, u] = calcXandU(x0, N, A, B, R, K)
    % Allocate memory for x and u for speed
    u{N} = 0;
    x{N+1} = 0;
    
    % Calculate x and u
    x{1} = x0;
    for i = 1:N
        u{i} = -(R + B'*K{i+1}*B)^(-1)*B'*K{i+1}*A*x{i};
        x{i+1} = A*x{i} + B*u{i};
    end
    
    x = [x{:}];
    u = [u{:}];
end