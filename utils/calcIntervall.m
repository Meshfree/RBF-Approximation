function ret = calcIntervall (points,intv)
[row,col] = size(points);
ret = zeros(row,col);
for i = 1:col
ret(:,i) = points(:,i).*(intv(2)-intv(1))+intv(1);
end
end