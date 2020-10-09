function out = IKcheat(H, d11, a22)
R = H(1:3,1:3);
d = H(1:3, 4);
eul = rotm2eul(double(R));
%theta2 must be ~= 0
d1 = d11;
a2 = a22;
%% cheat
% -sin(theta1) = R(1, 2)
% sin^2(theta1) = R(1, 2)^2
out(1) = atan2(H(1, 2)^2, (1-H(1, 2)^2));

% cos(theta2) = R(3, 4)
% cos^2(theta2) = R(3, 3)^2
out(2) = atan2((1 - H(3, 3)^2), H(3, 3)^2);

% H(3, 4) = d1 - a2*sin(theta2) - d3*sin(theta2)
% H(3, 4) - d1 + a2 * sin(theta2) = -d3 * sin(theta2)
out(3) = -(H(3, 4) - d1 + a2 * sin(out(2))) / (sin(out(2)));
