function ret = unitGrid(count)
count = floor(sqrt(count));
grid = linspace(0,1,count);
[xe,ye] = meshgrid(grid);
ret =[xe(:) ye(:)];
end