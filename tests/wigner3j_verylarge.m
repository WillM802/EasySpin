function [err,data] = test(opt,olddata)

% Test for some randomly selected parameters
%======================================================
a(1) = wigner3j(5000,4000,1000,25,-15,-10);
b(1) = -0.00139031548200721375124767565339;

ok = abs(a-b)<1e-9;
err = any(~ok);

data = [];
