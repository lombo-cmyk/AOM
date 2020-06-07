function r = visualize_results(x, u, J, Jv)
display_x = ['X values, x(1): ', num2str(x(1)), ...
                     ', x(2): ', num2str(x(2)), ...
                     ', x(3): ', num2str(x(3)), ...
                     ', x(4): ', num2str(x(4)), ...
                     ', x(5): ', num2str(x(5)), ...
                     ', x(6): ', num2str(x(6))];
              
display_u = ['U values, u(1): ', num2str(u(1)), ...
                     ', u(2): ', num2str(u(2)), ...
                     ', u(3): ', num2str(u(3)), ...
                     ', u(4): ', num2str(u(4)), ...
                     ', u(5): ', num2str(u(5)), ...
                     ', u(6): ', num2str(u(6))];
disp(display_x)
disp(display_u)
x_vector = [1:length(Jv)];
figure
scatter(x_vector, Jv, 200, 'red')
grid on
title("Jv")
xlabel("iteration")
ylabel("calculated value")
ax = gca;
ax.XTick = x_vector;
ax.YLim(2) = max(Jv)+2;

figure
scatter (x_vector, J, 200, 'red')
grid on
title("J")
xlabel("iteration")
ylabel("calculated value")
ax = gca;
ax.XTick = x_vector;
ax.YLim(2) = max(J)+2;
end