%min ? x1 + x2 + 2x3
%       2x1 + 3x2 ? 5
%       x2 + 2x3 ? 4
%       xi ? 0, xi ? Z, i = 1, 2, 3.
%TASK:
%Z = [1 1 2];
%A = [-2 -3 0;0 -1 -2];
%b = [-5; -4];

%EXAMPLE:
%Z = [8 11 4]
%A = [5 7 0; 3 0 3; 0 0 1]
%b = [5; 4; 1]
clc
clear all

Z = [8 11 4];
A = [-5 -7 0; -3 0 -7];
b = [-5; -4];
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_1=Xopt;
Zopt_1=Zopt;
for i = 1:3
    if abs(floor(Xopt(i))-Xopt(i))>0.000001
    Xopt(i)
    new_constraint = [floor(Xopt(i)) ceil(Xopt(i))];
    break
    end
end



%% 1 bad
A = [A; 0 0 1]
b = [b; new_constraint(1)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_2=Xopt;
Zopt_2=Zopt;
for i = 1:3
    if abs(floor(Xopt(i))-Xopt(i))>0.000001
    Xopt(i)
    new_constraint = [floor(Xopt(i)) ceil(Xopt(i))];
    break
    end
end
%min z 11
%% 2 gooood
A = [A; 0 0 -1]
b = [b; -new_constraint(2)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_2=Xopt;
Zopt_2=Zopt;
for i = 1:3
    if abs(floor(Xopt(i))-Xopt(i))>0.000001
    Xopt(i)
    new_constraint = [floor(Xopt(i)) ceil(Xopt(i))];
    break
    end
end
%min Z 12
%% 1_1
A = [A; 1 0 0]
b = [b; new_constraint(1)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_3=Xopt;
Zopt_3=Zopt;

%% 1_2
A = [A; -1 0 0]
b = [b; -new_constraint(2)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_3=Xopt;
Zopt_3=Zopt;

%% 2_1 good
A = [A; 0 1 0]
b = [b; new_constraint(1)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_3=Xopt;
Zopt_3=Zopt;

%% 2_2
A = [A; 0 -1 0]
b = [b; -new_constraint(2)]
[Xopt, Zopt] = linprog(Z, A, b, [], [], [0 0 0]);
Xopt_3=Xopt;
Zopt_3=Zopt;



