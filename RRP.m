%in = [theta1, theta2, d1, a2, d3];
a2 = 3;
d1 = 4;

% for t1 = 0 : 360
%     for t2 = -45 : 89
%         for d = 0 : 10
%             in = [deg2rad(t1), deg2rad(t2), d];
%             % cheat test
%             % out = IKcheat(FKNum(in, d1, a2), d1, a2);
%             F = FKNum(in, d1, a2);
%             out = IKHard(F(1,4), F(1,2), F(1,3), d1, a2);
%             if in ~= out
%                 disp("wow", in, out);
%             end
%         end
%     end
% end

J1 = JacobianNum(d1, a2);
J2 = JacobianClassic(d1, a2);
J3 = JacobianGeom(d1, a2);
%rank(J1)
%rank(J2)
%rank(J3)
% singularity, when theta2 = 90

%t = 0 : pi/100 : 2 * pi;
syms t real
std = diff(sin(t));
c2td = diff(cos(2*t));
s3td = diff(sin(3*t));

% stdn = subs(std,t);
% vel1 = subs(vel(0){theta1, theta2, d3}, {sin(t), cos(2*t), sin(3*t)}); 
theta1 = sin(t);
theta2 = cos(2*t);
d3 = sin(3*t);

vel = J1 * [std, c2td, s3td]';
temp = vel(1);
temp = subs(temp, theta1, sin(t))
%vo  = subs (vel, theta1, sin(t))
t = 0 : pi/100 : 2 * pi;
plot(vel(1), t)