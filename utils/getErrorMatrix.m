function [E,N,M] = getErrorMatrix(F,rbfG,neval, int,haltonIntv)

numberOfImpactPoints =haltonIntv(2);
numberOfCenterPoints =49; 

% centerOffset = 10;
% centerSteps = 10;

pointOffset = haltonIntv(1);
pointEnd = haltonIntv(3);
steps = (pointEnd - pointOffset) / numberOfImpactPoints;

E = zeros(numberOfImpactPoints,4);
N = zeros(numberOfImpactPoints,1);

grid = unitGrid(numberOfCenterPoints);

for i = 1:numberOfImpactPoints

    haltons = haltonWithCorners((i-1)*steps+ pointOffset,2);
    [E1,E2,E3,E4] = CalculateImpactOfEvaluationPoints(F,rbfG,haltons,grid,neval, int);
    E(i,1) = E1;
    E(i,2) = E2;
    E(i,3) = E3;
    E(i,4) = E4;
    N(i,1) = (i-1)*steps+ pointOffset;
       
end


end