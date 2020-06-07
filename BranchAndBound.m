function BranchAndBound(f, A, b, LB, UB)
    global results;
    [Xopt, fval, newLB, newUB, allIntegers] = LinProg(f, A, b, LB, UB);
    if isempty(Xopt)
        return;
    end
    if allIntegers
        results(end + 1, :) = {Xopt, fval};
        return;
    end
    if isempty(results) || fval < min([results{:,2}])
        BranchAndBound(f, A, b, newLB, UB);
        BranchAndBound(f, A, b, LB, newUB);
    end
end
