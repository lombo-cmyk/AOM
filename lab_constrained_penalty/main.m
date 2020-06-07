clc
clear all
%%%%%%
x_1 = 1;
x_6 = 6;
n=6;
%%%%%% defining parameters and initial values%%%%%%
alfa = 0.1;
beta = 5;
epsilon = 0.1;
epsilon_2 = 0.1;
c = 2;
t = 5;
a = [x_6, -1, 3];                                           %values of constraints, x_6=7, -1<u_i<3
v = a;                                                      %step 3
u0 = [1,2,3,4,5,6]                                          %random values of initial control
u=u0
i = 1;

while true
    Jv_function = @(u)calculate_penalty(x_1, u, n, v, t);   %step 1
    u = fminsearch(Jv_function, u);                         %finding un, step 4
    [Jv(i), x, J(i)] = calculate_penalty(x_1, u, n, v, t);  %finding xn, step 4
    r = calculate_r(x(6), v, u);                            %step 5
    gamma = norm(v+r-a);                                    %step 6
    
    if gamma > epsilon                                      %step 7
        if gamma < c                                        %step 8
            v= a-r;
            c = alfa*beta;
        else                                                %step 9
            t = beta*t;
            v = a - r / beta;
        end
        gamma = norm(v+r-a);
    end
    
    if (i >1)                                               %step 10
        j_jv = abs(prev_Jv - Jv(i))
        if gamma <= epsilon && j_jv < epsilon_2
            break
        end
    end
    
    prev_Jv=Jv(i);
    i=i+1;
end

visualize_results(x,u,J,Jv)

