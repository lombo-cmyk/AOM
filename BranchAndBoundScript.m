% Task 1
f = [1 1 2];
A = -[2 3 0; 0 1 2];
b = -[5; 4];
LB = [0, 0, 0];
UB = [Inf, Inf, Inf];

global results;
results = {};
BranchAndBound(f, A, b, LB, UB);
[~, solutionIndex] = min([results{:,2}]);
disp("The optimal solution is: " + num2str(results{solutionIndex, 1}))
disp("Cost value is: " + results{solutionIndex, 2})


% Task 2
f = -[5 3 4 3];
A = [4 3 2 2];
b = 6;
LB = [0 0 0 0];
UB = [1 1 1 1];

results = {};
BranchAndBound(f, A, b, LB, UB);
[~, solutionIndex] = min([results{:,2}]);
disp("The optimal solution is: " + num2str(results{solutionIndex, 1}))
disp("Cost value is: " + results{solutionIndex, 2})