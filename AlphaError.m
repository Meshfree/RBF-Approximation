close all;
clear variables;
clc;

addpath(genpath(pwd));

k = 300;
neval = 60;
intDefault = [0,1];

unit2DM81 = unitGrid(sqrt(81));

values = [3,4,5,7,9,10,12,15,17,20];
formats= [':ob';'--b';':*b';':sk';'--k';':*k';':oc';'--c';':*c';':om';'--m'];

numberOfImpactPoints = 4;

pointOffset = 700;
pointEnd = 1100;
standardIntv = [pointOffset,numberOfImpactPoints,pointEnd];

hold on;

figure1 = gcf;
figure2 = figure();


for i = 1:numel(values)
i

ep = values(i);
rbfG = @(r) exp(-(ep*r).^2);

[E1,N1] = getErrorMatrix(@F1,rbfG,neval,intDefault,standardIntv);

set(0,'currentfigure',figure1);
subplot(1,2,1);
hold on;
plot(N1,E1(:,1),formats(i,:));
subplot(1,2,2);
hold on;
plot(N1,E1(:,3),formats(i,:));

set(0,'currentfigure',figure2);
subplot(1,2,1);
hold on;
plot(N1,E1(:,2),formats(i,:));
subplot(1,2,2);
hold on;
plot(N1,E1(:,4),formats(i,:));

end

subplot(1,2,1);
legend(cellstr(num2str(values', 'ep=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Max errors');
subplot(1,2,2);
legend(cellstr(num2str(values', 'ep=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Mean Error');
set(0,'currentfigure',figure1);
subplot(1,2,1);
legend(cellstr(num2str(values', 'ep=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Max Error with polynomial');
subplot(1,2,2);
legend(cellstr(num2str(values', 'ep=%5.2f')));
xlabel('Halton Points');
ylabel('Error');
title('Mean Error with polynomial');