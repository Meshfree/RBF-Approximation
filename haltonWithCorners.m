function ret = haltonWithCorners(numberOfPoints,dim)

ret = haltonseq(numberOfPoints,dim);
ret = [ret;0,0;0,1;1,0;1,1];


end