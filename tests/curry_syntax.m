function [err,data] = test(opt,olddata)

% Syntax check

Sys.S = 1/2;
Sys.g = 2;

Exp.Temperature = 1;
Exp.Field = 7000;

Opt.nKnots = 8;

m = curry(Sys,Exp);
[m,chi] = curry(Sys,Exp);
m = curry(Sys,Exp,Opt);
[m,chi] = curry(Sys,Exp,Opt);


data = [];
err = false;
