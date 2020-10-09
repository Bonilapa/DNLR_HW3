function J = JacobianGeom(d11, a22)
%% not finished
d1 = d11;
a2 = a22;
H0 = ([1, 0, 0, 0;
    0, 1, 0, 0;
    0, 0, 1, 0;
    0, 0, 0, 1]);

syms theta1 theta2 d3 t real
H1 = Rz(theta1) * Tz(d1);
    
H2 =  H1 * Ry(theta2) * Tx(a2);
H3 = H2 * Tx(d3);

d0g = [0, 0, 0];
d1g = simplify(H1(1:3, 4));
d2g = simplify(H2(1:3, 4));
d3g = simplify(H3(1:3, 4));

R0 = H0(1:3,1:3);
R10 = simplify(H1(1:3,1:3));
R20 = simplify(H2(1:3,1:3));
R30 = simplify(H3(1:3,1:3));

J = [cross(R0 * [0,0,1]', d3g), cross(R10 * [0,0,1]', d3g - d1g), R20 * [0,0,1]';
    R0 * [0,0,1]', R10 * [0,0,1]', [0,0,0]'];