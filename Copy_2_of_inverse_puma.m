x = T(1,4);
y = T(2,4);
z = T(3,4);
dZ = z-L(1);
r = sqrt(x^2+y^2+dZ^2);

O11 = atan2(x, y);
O12 = atan2(-x, -y);

cosO3 = (r^2 - L(3)^2 - L(2)^2) / (2*L(2)*L(3));
sinO3 = sqrt(1-cosO3^2);

O31 = atan2(sinO3, cosO3);
O32 = atan2(-sinO3, cosO3);

sinOc1 = L(3)*sin(O31)/r;
cosOc1 = sqrt(1-sinOc1^2);
sinOc2 = L(3)*sin(O32)/r;
cosOc2 = sqrt(1-sinOc2^2);

O21 = atan2(-sinOc1, cosOc1) + atan2(dZ,-sqrt(x^2+y^2));
O22 = atan2(-sinOc1, -cosOc1) + atan2(dZ,-sqrt(x^2+y^2));
O23 = atan2(-sinOc2, cosOc2) + atan2(dZ,-sqrt(x^2+y^2));
O24 = atan2(-sinOc2, -cosOc2) + atan2(dZ,-sqrt(x^2+y^2));

q2 = [O12 O21 O31 0 0 0; 
    O11 O22 O32 0 0 0;
    O11 O23 O31 0 0 0; 
    O12 O24 O32 0 0 0];
% draw_robot(q_test2, L)

T456 = simplify(Ry(q4)*Rx(q5)*Ry(q6));
T123 = Rz(q2(1,1))*Tz(L(1))*Rx(q2(1,2))*Ty(L(2))*Rx(q2(1,3))*Ty(L(3));
T456bis = inv(T123)*T;
if abs(T456bis(3,3))~=1
    q2(1,4)= atan2(T456bis(1,3),-T456bis(2,3));
    q2(1,5) = atan2(sqrt(T456bis(1,3)^2+T456bis(2,3)^2),T456bis(3,3));
    q2(1,6)=atan2(T456bis(3,1),T456bis(3,2));
else
    disp('singular')
end
T123 = Rz(q2(2,1))*Tz(L(1))*Rx(q2(2,2))*Ty(L(2))*Rx(q2(2,3))*Ty(L(3));
T456bis = inv(T123)*T;
if abs(T456bis(3,3))~=1
    q2(2,4)=atan2(T456bis(1,3),-T456bis(2,3));
    q2(2,6)=atan2(T456bis(3,1),T456bis(3,2));
    q2(2,5) = atan2(sqrt(T456bis(1,3)^2+T456bis(2,3)^2),T456bis(3,3));
else
    disp('singular')
end
T123 = Rz(q2(3,1))*Tz(L(1))*Rx(q2(3,2))*Ty(L(2))*Rx(q2(3,3))*Ty(L(3));
T456bis = inv(T123)*T;
if abs(T456bis(3,3))~=-2
    q2(3,4)=atan2(-T456bis(1,3),T456bis(2,3));
    q2(3,6)=atan2(-T456bis(3,1),-T456bis(3,2));
    q2(3,5) = atan2(-sqrt(T456bis(1,3)^2+T456bis(2,3)^2),T456bis(3,3));
else
    disp('singular')
end
T123 = Rz(q2(4,1))*Tz(L(1))*Rx(q2(4,2))*Ty(L(2))*Rx(q2(4,3))*Ty(L(3));
T456bis = inv(T123)*T;
if abs(T456bis(3,3))~=1
    q2(4,4)=atan2(-T456bis(1,3),T456bis(2,3));
    q2(4,6)=atan2(-T456bis(3,1),-T456bis(3,2));
    q2(4,5) = atan2(-sqrt(T456bis(1,3)^2+T456bis(2,3)^2),T456bis(3,3));
else
    disp('singular')
end
q2