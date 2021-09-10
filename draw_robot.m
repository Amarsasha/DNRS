function draw_robot(q,L)
figure;
hold on
view(200,25)
grid on
xlabel('x')
ylabel('y')
zlabel('z')
axis equal

T1 = Rz(q(1)) * Tz(L(1));
plot3(0, 0, 0, 'ro', 'MarkerSize', 10, 'LineWidth', 10);
plot3([0 T1(1,4)], [0 T1(2,4)], [0 T1(3,4)], '-b', 'LineWidth', 5);

T2 = Rz(q(1)) * Tz(L(1)) * Rx(q(2)) * Ty(L(2));
plot3([T1(1,4) T2(1,4)], [T1(2,4) T2(2,4)], [T1(3,4) T2(3,4)], '-b', 'LineWidth', 5);
plot3(T1(1,4), T1(2,4), T1(3,4), 'ro', 'MarkerSize', 10, 'LineWidth', 10);

T3 = Rz(q(1)) * Tz(L(1)) * Rx(q(2)) * Ty(L(2))* Rx(q(3)) * Ty(L(3));
plot3([T2(1,4) T3(1,4)], [T2(2,4) T3(2,4)], [T2(3,4) T3(3,4)], '-b', 'LineWidth', 5);
plot3(T2(1,4), T2(2,4), T2(3,4), 'ro', 'MarkerSize', 10, 'LineWidth', 10);

T3x = Rz(q(1)) * Tz(L(1)) * Rx(q(2)) * Ty(L(2))* Rx(q(3)) * Ty(L(3)) * Ry(q(4)) * Rx(q(5)) * Ry(q(6)) * Tx(5);
quiver3(T3(1,4), T3(2,4), T3(3,4), T3x(1,4) - T3(1,4), T3x(2,4) - T3(2,4), T3x(3,4)-T3(3,4), 0, '-p')
T3y = Rz(q(1)) * Tz(L(1)) * Rx(q(2)) * Ty(L(2))* Rx(q(3)) * Ty(L(3)) * Ry(q(4)) * Rx(q(5)) * Ry(q(6)) * Ty(5);
quiver3(T3(1,4), T3(2,4), T3(3,4), T3y(1,4) - T3(1,4), T3y(2,4) - T3(2,4), T3y(3,4) - T3(3,4), 0, '-c')
T3z = Rz(q(1)) * Tz(L(1)) * Rx(q(2)) * Ty(L(2))* Rx(q(3)) * Ty(L(3)) * Ry(q(4)) * Rx(q(5)) * Ry(q(6)) * Tz(5);
quiver3(T3(1,4), T3(2,4), T3(3,4), T3z(1,4) - T3(1,4), T3z(2,4) - T3(2,4), T3z(3,4) - T3(3,4), 0, '-g')
% draw_robot()



















