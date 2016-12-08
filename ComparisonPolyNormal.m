close all;
clear variables;
clc;
addpath(genpath(pwd));
alpha =3;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

% x=linspace(0,1000,100);
% % figure;
% plot(x,rbfIQ(x));

load('centerPoints.mat')
load('haltonPoints.mat')
load('epsilonPoints.mat')
load('unitGridPoints.mat')

neval =60;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);

epoints = [xe(:) ye(:)];
[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F2, rbfG, haltonPoints2000, centerPoints225,epoints);

% figure;
% surf(xe,ye,reshape(pf_p,neval,neval))

epsilon = {epsilonPoints1000,epsilonPoints1200,epsilonPoints1400,epsilonPoints1600,epsilonPoints1800,epsilonPoints2000};
halton = {haltonPoints1000,haltonPoints1200,haltonPoints1400,haltonPoints1600,haltonPoints1800,haltonPoints2000};
unit = {unitGrid1000,unitGrid1200,unitGrid1400,unitGrid1600,unitGrid1800,unitGrid2000};

e = zeros(length(epsilon),4)
for i =1:length(epsilon)
    x =i*200 + 1000;
    [pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F3, rbfIQ, epsilon{i}, centerPoints225,epoints);
    e(i,:) = [x,E(1),x,E(3)];
end
h =zeros(length(halton),4);
for i =1:length(halton)
     x =i*200 + 1000;
    [pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F3, rbfIQ, halton{i}, centerPoints225,epoints);
    h(i,:) = [x,E(1),x,E(3)];
end

u = zeros(length(unit),4);
for i =1:length(unit)
     x =i*200 + 1000;
    [pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F3, rbfIQ, unit{i}, centerPoints225,epoints);
    u(i,:) =  [x,E(1),x,E(3)];
end

plot(e(:,1),e(:,2),'--r*',e(:,3),e(:,4),'-r',h(:,1),h(:,2),'--gs',h(:,3),h(:,4),'-g',u(:,1),u(:,2),'--bo',u(:,3),u(:,4),'-b')
legend('epsilonPoints','epsilonPoints polynom','haltonPoints','haltonPoints with polynom','unitPoints','unitPoints with polynom')
xlabel('number of used points');
ylabel('Error');


% errorPfandPf_p = abs(pf_p -exact)- abs(pf-exact);
% figure;
% load('colormap')
% surf(xe,ye,reshape(errorPfandPf_p,neval,neval));
% 
% maxError =max(E(1),E(3));
% figure;
% fview = [100,30]; % viewing angles for plot
% subplot(2,2,1);
% PlotSurf(xe,ye,pf,neval,exact,E(1),fview);
% subplot(2,2,2);
% PlotSurf(xe,ye,pf_p,neval,exact,E(3),fview);
% subplot(2,2,3);
% PlotError2D(xe,ye,pf,exact,E(1),neval,fview);
% subplot(2,2,4);
% PlotError2D(xe,ye,pf_p,exact,E(3),neval,fview);
% figure;
% plot(haltonPoints2000(:,1),haltonPoints2000(:,2),'bo',centerPoints225(:,1),centerPoints225(:,2),'rx')

