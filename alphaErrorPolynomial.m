close all;
clear variables;
clc;

addpath(genpath(pwd));

k = 300;
neval = 60;
intDefault = [0,1];

values_p =  [2.5,3.0,3.5];
formats= [':ob';'--b';':*b';':sk';'--k';':*k';':oc';'--c';':*c';':om';'--m'];


hold on;

load('centerPoints.mat')
load('haltonPoints.mat')
load('unitGridPoints.mat')

haltons ={haltonPoints500,haltonPoints700,haltonPoints1000,haltonPoints1100,haltonPoints1400,haltonPoints2000};
haltonsEdges ={haltonPointsEdges500,haltonPointsEdges700,haltonPointsEdges1000,haltonPointsEdges1100,haltonPointsEdges1400,haltonPointsEdges2000};
units = {unitGrid500,unitGrid700,unitGrid1000,unitGrid1100,unitGrid1400,unitGrid2000};

for i = 1:numel(values_p)
i
alpha = values_p(i);
rbfG = @(r) exp(-(alpha*r).^2);
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

[E1_p,N1_p] = getErrorMatrix(@F3,rbfIQ,neval,intDefault,haltons,centerPoints225);

subplot(1,2,1);
hold on;
plot(N1_p,E1_p(:,3),formats(i,:));
subplot(1,2,2);
hold on;
plot(N1_p,E1_p(:,4),formats(i,:));

end

subplot(1,2,1);
legend(cellstr(num2str(values_p', 'alpha=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Max Error with polynomial');
subplot(1,2,2);
legend(cellstr(num2str(values_p', 'alpha=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Mean Error with polynomial');
