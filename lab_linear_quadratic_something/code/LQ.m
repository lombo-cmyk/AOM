clear variables;
close all;

% System and quality index data
A = [ 1,  1; 
      1,  2];
B = [ 2,  4]';
Q = [13, -4;
     -4,  9];
R = [ 4];
F = zeros(2, 2);
N = 20;

% Test if Q, F and R are symmetrical and definite/semidefinite
if ~(testMat(Q, GreaterThanEqual(0)) && ...
     testMat(F, GreaterThanEqual(0)) && ...
     testMat(R, GreaterThan(0)))
    
    error('Choose proper matrices.');
end

% Test if system is controllable
if ~isControllable(A, B)
    error('System is not controllable');
end

% -------------------------------------------------------------------------
% --------------------- Initial conditions influence ----------------------
% -------------------------------------------------------------------------

% Set of all initial conditions
x0set = {[10,  5]', ...
         [10, 30]', ...
         [10, 50]', ...
         [10, 15]', ...
         [ 5, 15]', ...
         [30, 15]', ...
         [50, 15]'};

% Legend array
legendArray = makeLegend(x0set, 'x0');

% stairs colors
colors = ['r', 'g', 'b', 'c', 'm', 'y', 'k'];

% Labels
labels = ["x1", "x2", "u"];

% Figures
fx1 = figure;
hold on;
fx2 = figure;
hold on;
fu = figure;
hold on;
f = [fx1, fx2, fu];

% Calculate all Ki
K = calculateK(A, B, Q, R, F, N);

% For all initial conditions
for i = 1:length(x0set)
    x0 = x0set{i};
    color = colors(i);
    
    % The performance index
    Jo = perfIndex(x0, K{1});
    
    % Print results
    fprintf("x0 = [%2d, %2d]'\t--->\tJo = %f\n", x0(1), x0(2), Jo);

    % Calculate x and u
    [x, u] = calcXandU(x0, N, A, B, R, K);

    % stairs everything
    figure(fx1);
    stairs(x(1, :), color);
    figure(fx2);
    stairs(x(2, :), color);
    figure(fu);
    stairs(u, color);
end

% Finish figure setup
for i = 1:3
    figure(f(i));
    title('Initial conditions influence');
    ylabel(labels(i));
    legend(legendArray);
end

% -------------------------------------------------------------------------
% --------------------------- R value influence ---------------------------
% -------------------------------------------------------------------------

% Array of R values to test
Rset = num2cell(4:10:64);

% Initial condition
x0 = [10, 15]';

% Figures
fx1 = figure;
hold on;
fx2 = figure;
hold on;
fu = figure;
hold on;
f = [fx1, fx2, fu];

% Legend array
legendArray = makeLegend(Rset, 'R');

% For all R values
for i = 1:length(Rset)
    R = Rset{i};
    color = colors(i);
    
    % Calculate all Ki
    K = calculateK(A, B, Q, R, F, N);
    
    % The performance index
    Jo = perfIndex(x0, K{1});
    
    % Print results
    fprintf("R = %2d\t--->\tJo = %f\n", R, Jo);
    
    % Calculate x and u
    [x, u] = calcXandU(x0, N, A, B, R, K);

    % stairs everything
    figure(fx1);
    stairs(x(1, :), color);
    figure(fx2);
    stairs(x(2, :), color);
    figure(fu);
    stairs(u, color);
end

% Finish figure setup
for i = 1:3
    figure(f(i));
    title('R value influence');
    ylabel(labels(i));
    legend(legendArray);
end

% -------------------------------------------------------------------------
% -------------------------- K elements settling --------------------------
% -------------------------------------------------------------------------

% Example values
x0 = [10, 5]';
R = 4;

% Calculate all Ki and get their elements
K = cell2mat(calculateK(A, B, Q, R, F, N)');
K11 = K(1:2:end, 1);
K12 = K(1:2:end, 2);
K21 = K(2:2:end, 1);
K22 = K(2:2:end, 2);

% stairs everything
fK = figure;
hold on;
stairs(K11, 'r');
stairs(K12, 'g');
stairs(K21, 'b');
stairs(K22, 'c');
title('K elements');
ylabel('K');
legend('K11', 'K12', 'K21', 'K22');