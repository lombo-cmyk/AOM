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
        if any(newLB ~= LB)
            BranchAndBound(f, A, b, newLB, UB);
        end
        if any(newUB ~= UB)
            BranchAndBound(f, A, b, LB, newUB);
        end
    else
        return;
    end
end
