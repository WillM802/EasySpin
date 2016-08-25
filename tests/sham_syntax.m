function [err,data] = test(opt,olddata)

% Test 1: Sytnax
%======================================================
sys = struct('S',1/2,'g',[2 3 4]);
B = rand(1,3)*400;
[F,Gx,Gy,Gz] = sham(sys);
[F,G] = sham(sys,B);
H = sham(sys,B);

err = 0;
data = [];