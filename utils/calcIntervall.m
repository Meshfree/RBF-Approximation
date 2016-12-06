function ret = calcIntervall (points,intvBegin,invEnd)
[row,col] = size(points);
ret = zeros(row,col);
for i = 1:col
ret(:,i) = points(:,i).*(invEnd(i)-intvBegin(i))+intvBegin(i);
end
end