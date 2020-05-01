function [Xopt, Zopt, constraints, i] = linprog_new_constraints(Z,A,B)
    constraints = [];
    i = [];
    [Xopt, Zopt] = linprog(Z, A, B, [], [], [0 0 0]);
    if isempty(Xopt)
        return
    end
    for i = 1:3
        if abs(round(Xopt(i))-Xopt(i))>0.00001
        constraints = [floor(Xopt(i)) ceil(Xopt(i))];
        break
        end
    end
    Xopt=Xopt';
end