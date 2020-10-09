function H = FK()
syms theta1 theta2 d3 d1 a2 real
H = Rz(theta1) * Tz(d1) * Ry(theta2) * Tx(a2) * Tx(d3);
H = simplify(H);