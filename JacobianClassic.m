function J = JacobianClassic(d11, a22)
d1 = d11;
a2 = a22;
syms theta1 theta2 d3 t real
x = (a2 + d3) * cos(theta1) * cos(theta2);
y = (a2 + d3) * sin(theta1) * cos(theta2);
z = d1 + (a2 + d3) * sin(theta2);
ksi = - diff(theta2, t) * sin(theta1);
gamma = diff(theta2, t) * cos(theta1);
zetta = theta1;

J = [diff(x, theta1), diff(x, theta2), diff(x, d3);
    diff(y, theta1), diff(y, theta2), diff(y, d3);
    diff(z, theta1), diff(z, theta2), diff(z, d3);
    diff(ksi, theta1), diff(ksi, theta2), diff(ksi, d3);
    diff(gamma, theta1), diff(gamma, theta2), diff(gamma, d3);
    diff(zetta, theta1), diff(zetta, theta2), diff(zetta, d3)];