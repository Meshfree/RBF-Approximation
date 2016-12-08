close all;
clear variables;
clc;

addpath(genpath(pwd));

k = 300;
neval = 60;
intDefault = [0,1];

values = (1:0.1:3);
formats= [':ob';'--b';':*b';':sk';'--k';':*k';':oc';'--c';':*c';':om';'--m'];

hold on;

load('centerPoints.mat')
load('haltonPoints.mat')
load('unitGridPoints.mat')

haltons ={haltonPoints700,haltonPoints1000,haltonPoints1100,haltonPoints1400,haltonPoints2000};
haltonsEdges ={haltonPointsEdges500,haltonPointsEdges700,haltonPointsEdges1000,haltonPointsEdges1100,haltonPointsEdges1400,haltonPointsEdges2000};
units = {unitGrid500,unitGrid700,unitGrid1000,unitGrid1100,unitGrid1400,unitGrid2000};

E_values = zeros(length(haltons),length(values));
E_values_max = zeros(length(haltons),length(values));
for i = 1:numel(haltons)


for j = 1:length(values)
alpha = values(j);
rbfG = @(r) exp(-(alpha*r).^2);
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

[E1,N1] = getErrorMatrix(@F3,rbfIQ,neval,intDefault,haltons(i),centerPoints225);
E_values(i,j) = E1(1);
E_values_max(i,j) = E1(2);
end
subplot(1,2,1);
hold on;
plot(values,E_values(i,:),formats(i,:));
subplot(1,2,2);
hold on;
plot(values,E_values_max(i,:),formats(i,:));

end

sizeHalton = cellfun('length',haltons)';
subplot(1,2,1);
legend(cellstr(num2str(sizeHalton, 'haltons:%5.0f')));
xlabel('Halton Points');
ylabel('Error');
title('Max error');
subplot(1,2,2);
legend(cellstr(num2str(sizeHalton, 'haltons:%5.0f')));
xlabel('Halton Points');
ylabel('Error');
title('Mean Error');
