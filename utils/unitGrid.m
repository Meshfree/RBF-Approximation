function ret = unitGrid(count)
grid = linspace(0,1,count);
[xe,ye] = meshgrid(grid);
ret =[xe(:) ye(:)];
end