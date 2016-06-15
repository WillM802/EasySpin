function [err,data] = test(opt,olddata)

%======================================================
% Test 6: 2 electron spins 1/2, check values
%======================================================
Sys = struct('S',[1/2 1/2],'g',[2 2 2; 2 2 2]);
Sys.ee = [3 4 5];
a = [1 4 2 3 2 3 1 4];
b = [1 1 2 2 3 3 4 4];
c = [5 -1 -5 7 7 -5 -1 5]/4;
H0 = full(sparse(a,b,c));
H1 = eeint(Sys);
err = any(H0(:)~=H1(:));
data = [];
