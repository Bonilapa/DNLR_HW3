function H = FKNum(in, d11, a22)
syms theta1 theta2 d3 d1 a2 real
H = FK();
H = subs(FK(), {theta1, theta2, d1, a2, d3}, {in(1), in(2), d11, a22, in(3)});