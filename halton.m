function ret = halton (k,dim)
N = (2^k + 1)^2;
ret = haltonseq(N,dim);
end