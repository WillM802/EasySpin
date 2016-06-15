function [err,data] = test(opt,olddata)

% Syntax tests
%====================================================
Sys.S = 1/2;
Sys.g = [2 3 4];
phi = 0.4564;
theta = 1.14343564;
chi = 0.16434345;
B = linspace(0,100,201);

% magnetic field vector, (phi,theta) orientation
E = levels(Sys,[phi theta],B);
E = levels(Sys,phi,theta,B);
[E,V] = levels(Sys,[phi theta],B);
[E,V] = levels(Sys,phi,theta,B);

% magnetic field limits [Bmin Bmax], (phi,theta) orientation
Brange = [30 100];
E = levels(Sys,[phi theta],Brange);
E = levels(Sys,phi,theta,Brange);
[E,V] = levels(Sys,[phi theta],Brange);
[E,V] = levels(Sys,phi,theta,Brange);

% magnetic field vector, (phi,theta,chi) orientation
E = levels(Sys,[phi theta chi],B);
E = levels(Sys,phi,theta,B);
[E,V] = levels(Sys,[phi theta],B);
[E,V] = levels(Sys,phi,theta,B);


err = 0;
data = [];
