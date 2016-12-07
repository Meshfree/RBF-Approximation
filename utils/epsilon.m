function epsilon = epsilon(numberOfPartsX,numberOfPartsY)
%    numberOfDims =  numel(delta);

    if(nargin==1)
        numberOfPartsY = floor(sqrt(numberOfPartsX));
        numberOfPartsX = floor(sqrt(numberOfPartsX));
    end
     deltaX= 1/numberOfPartsX;
     deltaY= 1/numberOfPartsY;
    
    eX = 0.25 * deltaX;
    eY = 0.25 * deltaY;
    
    linX = linspace (0,1,numberOfPartsX);
    linY = linspace (0,1,numberOfPartsY);
    
    [gridX,gridY] = meshgrid(linX,linY);
    
    randomX =rand(numberOfPartsY,numberOfPartsX) - 0.5;
    randomY = rand(numberOfPartsY,numberOfPartsX) - 0.5;
    
 
    gridX = gridX + randomX * eX;
    gridY =gridY + randomY * eY;
    
    epsilon = [gridX(:),gridY(:)];
   
end