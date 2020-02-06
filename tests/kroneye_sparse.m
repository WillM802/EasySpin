function err = test()

A = sparse(rand(2));
nI = 3;
B1 = runprivate('kroneye',A,nI,false);
B2 = runprivate('kroneye',A,nI,true);

err = ~areequal(B1,B2,1e-15,'abs');