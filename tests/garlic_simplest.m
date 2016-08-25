function [err,data] = test(opt,olddata)

Sys = struct('g',2,'Nucs','1H','lw',[0,0.01],'A',10);
Exp = struct('mwFreq',9.7);
Opt = struct('Verbosity',opt.Verbosity);
[x,y] = garlic(Sys,Exp,Opt);

data.x = x;
data.y = y;

if ~isempty(olddata)
  maxy = max(abs(y));
  err = ~areequal(x,olddata.x) | ~areequal(y,olddata.y,maxy*1e-4);
else
  err = [];
end

if (opt.Display)
  if ~isempty(olddata)
    plot(olddata.x,olddata.y,'b',data.x,data.y,'r');
    legend('old','new');
  else
    plot(x,y);
  end
  xlabel('magnetic field [mT]');
  axis tight;
end