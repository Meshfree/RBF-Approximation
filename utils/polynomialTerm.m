function P = polynomialTerm(dsites,degree)
[M,~] = size(dsites);
%[dr,cc] = ndgrid(dsites(:,1),dsites(:,2));
%[dsites(:,1).*dsites(:,2)
P = [dsites.^2,dsites,ones(M,1)];
end