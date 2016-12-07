function [E,N] = getErrorMatrix(F,rbfG,neval, int,haltons,ctr)

gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);
epoints = [xe(:) ye(:)];

E = zeros(length(haltons),4);
N = zeros(length(haltons),1);

for i = 1:length(haltons)

    [~,~,Error] = CalculateImpactOfEvaluationPoints(F,rbfG,haltons{i},ctr,epoints);
    E(i,:) = Error;
    N(i,1) = length(haltons{i});
       
end

end