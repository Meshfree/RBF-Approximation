close all;
clear variables;
clc;

addpath(genpath(pwd));

k = 300;
neval = 60;
intDefault = [0,1];

% values = [4.0,4.2,4.5];
values = (1:0.5:5);
formats= [':ob';'--b';':*b';':sk';'--k';':*k';':oc';'--c';':*c';':om';'--m'];

hold on;

load('centerPoints.mat')
load('haltonPoints.mat')
load('unitGridPoints.mat')

haltons ={haltonPoints500,haltonPoints700,haltonPoints1000,haltonPoints1100,haltonPoints1400,haltonPoints2000};
haltonsEdges ={haltonPointsEdges500,haltonPointsEdges700,haltonPointsEdges1000,haltonPointsEdges1100,haltonPointsEdges1400,haltonPointsEdges2000};
units = {unitGrid500,unitGrid700,unitGrid1000,unitGrid1100,unitGrid1400,unitGrid2000};

E_values = zeros(length(values),length(haltons));
for i = 1:numel(haltons)


for j = 1:length(values)
alpha = values(j);
rbfG = @(r) exp(-(alpha*r).^2);
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

[E1,N1] = getErrorMatrix(@F2,rbfIQ,neval,intDefault,haltons(i),centerPoints225);
E_values(j,i) = E1(1);
end
subplot(1,2,1);
hold on;
plot(values,E_values(:,1),formats(i,:));
subplot(1,2,2);
hold on;
plot(values,E_values(:,2),formats(i,:));

end

subplot(1,2,1);
legend(cellstr(num2str(values', 'alpha=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Max errors');
subplot(1,2,2);
legend(cellstr(num2str(values', 'alpha=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Mean Error');

