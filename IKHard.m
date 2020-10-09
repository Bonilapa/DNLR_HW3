function out = IKHard(x, y, z, d1, a2)

out(0, 1) = atan2(y, x);
out(0, 2) = atan2((z - d1), (x^2 + y^2));
out(0, 3) = sqrt((x^2 + y^2)^2 + (z - d1)^2) -a2;
out(1, 1) = out(0, 1) + pi;
out(1, 2) = pi - out(0, 2);
out(1, 3) = out(0, 3);
