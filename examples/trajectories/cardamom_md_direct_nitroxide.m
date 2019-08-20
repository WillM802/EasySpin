% simulation of a cw EPR spectrum using a molecular dynamics trajectory of
% a MTSSL-labeled polyalanine helix
%==========================================================================
% Note that the length of the frame trajectory used here is short, and in
% practice one would need to use a trajectory that is perhaps 5 times onger

% Load pre-processed MD frame trajectory (generated by mdload)
FrameTrajFile = load('MTSSL_polyAla_trajectory.mat');

MD = FrameTrajFile.MD;  % initialize the MD structure using loaded data

tScale = 2.5;          % diffusion constant of TIP3P model water 
                          % molecules in MD  simulations is ~2.5x too high, 
                          % so we scale the time axis
MD.dt = tScale*MD.dt;
                          
MD.removeGlobal = 0;      % protein was fixed during MD simulation, so 
                          % there is no need to remove global diffusion

MD.DiffGlobal = 6e6;      % add back stochastic global rotational diffusion 
                          % for the protein

% simulate spectrum using cardamom

Sys.Nucs = '14N';
Sys.g = [2.009, 2.006, 2.002];
Sys.A = mt2mhz([6, 36]/10);
Sys.lw = [0, 0.1];

Par.nTraj = 100;
Par.dt = 1.0e-9;
Par.nSteps = ceil(250e-9/Par.dt);  % number of time steps in FID
Par.Model = 'MD-direct';
Par.nOrients = 200;

Exp.mwFreq = 9.4;

Opt.Verbosity = 1;
Opt.Method = 'fast';

[B, spc] = cardamom(Sys,Exp,Par,Opt,MD);

% plot spectrum

plot(B, spc)
axis tight
set(gca,'ytick',[])
ylabel('Absorption derivative')
xlabel('B (mT)')