function [A_new, b_new] = calculate_parameters(loop_iter, i, costraint, A_old, b_old)
    temp = [0 0 0];
    if loop_iter == 1
        temp(i)=1;
        b_new = [b_old; costraint(1)];
    else
        temp(i)=-1;
        b_new = [b_old; -costraint(2)];
    end
    A_new = [A_old; temp];
end