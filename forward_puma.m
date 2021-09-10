syms q1 q2 q3 q4 q5 q6 real

L1 = 1;
L2 = 2;
L3 = 1;
L = [L1, L2, L3];

FK = simplify(Rz(q1)*Tz(L1)*Rx(q2)*Ty(L2)*Rx(q3)*Ty(L3)*Ry(q4)*Rx(q5)*Ry(q6));

q_test = [0 0 0 0 0 0];

T = double(subs(FK, [q1 q2 q3 q4 q5 q6], q_test));
T
% draw_robot(q_test, L)
% disp('random configuration')
% q_test = [-10*pi/180 -50*pi/180 20 50*pi/180 0 -60*pi/180];
% draw_robot(q_test, L)
% T = double(subs(FK, [q1 q2 q3 q4 q5 q6], q_test));