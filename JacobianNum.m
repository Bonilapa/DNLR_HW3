function J = JacobianNum(d11, a22)
%d1 = d11;
%a2 = a22;
H = FK();
R = simplify(H(1:3, 1:3));
invR = inv(R);
O = [invR, zeros(3,1); 0 0 0 1];
%% theta1
syms theta1 theta2 d3 d1 a2 real

Jt1r = Rzd(theta1) * Tz(d1) * Ry(theta2) * Tx(a2) * Tx(d3) * O;
Jt1r = simplify(Jt1r);
J1 = [Jt1r(1,4), Jt1r(2,4), Jt1r(3,4), Jt1r(3,2), Jt1r(1,3), Jt1r(2,1)];
J1 = subs(J1, {d1, a2}, {d11, a22});

%% theta2
Jt2r = Rz(theta1) * Tz(d1) * Ryd(theta2) * Tx(a2) * Tx(d3) * O;
Jt2r = simplify(Jt2r);
J2 = [Jt2r(1,4), Jt2r(2,4), Jt2r(3,4), Jt2r(3,2), Jt2r(1,3), Jt2r(2,1)];
J2 = subs(J2, {d1, a2}, {d11, a22});

%% theta3
Jd3r = Rz(theta1) * Tz(d1) * Ry(theta2) * Tx(a2) * Txd(d3) * O;
Jd3r = simplify(Jd3r);
J3 = [Jd3r(1,4), Jd3r(2,4), Jd3r(3,4), Jd3r(3,2), Jd3r(1,3), Jd3r(2,1)];
J3 = subs(J3, {d1, a2}, {d11, a22});

J = [simplify(J1); simplify(J2); simplify(J3)]';
