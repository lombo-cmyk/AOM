%TASK:
%Z_input = [1 1 2];
%A_input = [-2 -3 0;0 -1 -2];
%b_input = [-5; -4];

%EXAMPLE:
%Z_input = [8 11 4]
%A_input = [-5 -7 0; -3 0 -7];
%b_input = [-5; -4];

clc
clear all

Z_input = [8 11 4];
A_input = [-5 -7 0; -3 0 -7];
b_input = [-5; -4];
[Xopt, Zopt, costraint, i] = linprog_new_constraints(Z_input, A_input, b_input);
Results = [];
for main_loop= 1:2
    [A_main, b_main] = calculate_parameters(main_loop, i, costraint, A_input, b_input);
    [Xopt, Zopt, main_costraint, j] = linprog_new_constraints(Z_input, A_main, b_main);
    if isempty(Xopt)
        continue
    elseif isempty(main_costraint)
        Results=[Results; Zopt, Xopt];
        sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
        continue
    end
    for second_loop = 1:2
        [A_second, b_second] = calculate_parameters(second_loop, j, main_costraint, A_main, b_main);
        [Xopt, Zopt, second_costraint, k] = linprog_new_constraints(Z_input, A_second, b_second);
        if isempty(Xopt)
            continue
        elseif isempty(second_costraint)
            sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
            Results=[Results; Zopt, Xopt];
            continue
        end
        for third_loop = 1:2
            [A_third, b_third] = calculate_parameters(third_loop, k, second_costraint, A_second, b_second);
            [Xopt, Zopt, third_costraint, z] = linprog_new_constraints(Z_input, A_third, b_third);
            if isempty(Xopt)
                continue
            elseif isempty(third_costraint)
                Results=[Results; Zopt, Xopt];
                sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
                continue
            end         
        end
    end
end
[M, I] = min(Results(:,1));
sprintf('The optimal solution is: x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f', Results(I,2),Results(I,3),Results(I,4),Results(I,1))