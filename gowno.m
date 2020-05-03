
clc
clear all

Z_input = [2 5 3 2];
A_input = [3 2 4 1; 1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
b_input = [6;1;1;1;1];
[Xopt, Zopt, costraint, i] = linprog_new_constraints(-Z_input, A_input, b_input);
Results = [];
for main_loop= 1:2
    [A_main, b_main] = calculate_parameters(main_loop, i, costraint, A_input, b_input);
    [Xopt, Zopt, main_costraint, j] = linprog_new_constraints(-Z_input, A_main, b_main);
    if isempty(Xopt)
        continue
    elseif isempty(main_costraint)
        Results=[Results; Zopt, Xopt];
        sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
        continue
    end
    for second_loop = 1:2
        [A_second, b_second] = calculate_parameters(second_loop, j, main_costraint, A_main, b_main);
        [Xopt, Zopt, second_costraint, k] = linprog_new_constraints(-Z_input, A_second, b_second);
        if isempty(Xopt)
            continue
        elseif isempty(second_costraint)
            sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
            Results=[Results; Zopt, Xopt];
            continue
        end
        for third_loop = 1:2
            [A_third, b_third] = calculate_parameters(third_loop, k, second_costraint, A_second, b_second);
            [Xopt, Zopt, third_costraint, z] = linprog_new_constraints(-Z_input, A_third, b_third);
            if isempty(Xopt)
                continue
            elseif isempty(third_costraint)
                Results=[Results; Zopt, Xopt];
                sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
                continue
            end
            for forth_loop = 1:2
                [A_forth, b_forth] = calculate_parameters(forth_loop, z, third_costraint, A_third, b_third);
                [Xopt, Zopt, forth_costraint, z] = linprog_new_constraints(-Z_input, A_forth, b_forth);
                if isempty(Xopt)
                    continue
                elseif isempty(forth_costraint)
                    Results=[Results; Zopt, Xopt];
                    sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
                    continue
                end
            end
        end
    end
end
[M, I] = min(Results(:,1));
sprintf('The optimal solution is: x1:%.2f, x2:%.2f, x3:%.2f, x4:%.2f, Z:%.2f', Results(I,2),Results(I,3),Results(I,4),Results(I,4),Results(I,1))