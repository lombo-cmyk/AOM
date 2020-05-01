%TASK:
%Z = [1 1 2];
%A = [-2 -3 0;0 -1 -2];
%b = [-5; -4];

%EXAMPLE:
%Z = [8 11 4]
%A = [5 7 0; 3 0 7];
%b = [5; 4];

clc
clear all

Z_input = [1 1 2];
A_input = [-2 -3 0;0 -1 -2];
b_input = [-5; -4];
[Xopt, Zopt, costraint, i] = linprog_new_constraints(Z_input, A_input, b_input);
Results = zeros(14,5);
%Results(1,:) = [Xopt Zopt 1]
%%
for main_loop= 1:2
    temp = [0 0 0];
    [Xopt, Zopt, costraint, i] = linprog_new_constraints(Z_input, A_input, b_input);
        if main_loop == 1
        temp(i)=1;
        b_main = [b_input; costraint(1)];
        else
        temp(i)=-1;
        b_main = [b_input; -costraint(2)];
        end
    A_main = [A_input; temp];
    [Xopt, Zopt, main_costraint, i] = linprog_new_constraints(Z_input, A_main, b_main);
    if isempty(Xopt)
        continue
    elseif isempty(main_costraint)
        sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
        continue
    end
    for second_loop = 1:2
        [Xopt, Zopt, main_costraint, i] = linprog_new_constraints(Z_input, A_main, b_main);
        temp = [0 0 0];
        if second_loop == 1
        temp(i)=1;
        b_second = [b_main; main_costraint(1)];
        else
        temp(i)=-1;
        b_second = [b_main; -main_costraint(2)];
        end
        A_second = [A_main; temp];
        [Xopt, Zopt, second_costraint, j] = linprog_new_constraints(Z_input, A_second, b_second);
        if isempty(Xopt)
            continue
        elseif isempty(second_costraint)
            sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
            continue
        end
       for third_loop = 1:2
           [Xopt, Zopt, second_costraint, j] = linprog_new_constraints(Z_input, A_second, b_second);
           temp = [0 0 0];
           if third_loop == 1
           temp(j)=1;
           b_third = [b_second; second_costraint(1)];
           else
           temp(j)=-1;
           b_third = [b_second; -second_costraint(2)];
           end
           A_third = [A_second; temp];
           [Xopt, Zopt, third_costraint, j] = linprog_new_constraints(Z_input, A_third, b_third);
           if isempty(Xopt)
               continue
           elseif isempty(third_costraint)
               sprintf('x1:%.2f, x2:%.2f, x3:%.2f, Z:%.2f',Xopt(1),Xopt(2),Xopt(3),Zopt)
               continue
           end
           
       end
    end
end