function [Xopt, fval, LB, UB, allIntegers] = LinProg(f, A, b, LB, UB)
    allIntegers = 0;    
    [Xopt, fval] = linprog(f, A, b, [], [], LB, UB);
    if isempty(Xopt)
        return
    end
    allIntegers = 1;
    for i = 1:length(Xopt)
        if abs(round(Xopt(i)) - Xopt(i)) > 0.00001
            LB(i) = ceil(Xopt(i));
            UB(i) = floor(Xopt(i));
            allIntegers = 0;
            break
        end
    end
    Xopt = Xopt';
end
