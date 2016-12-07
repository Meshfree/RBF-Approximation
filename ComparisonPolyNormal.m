close all;
clear variables;
clc;
addpath(genpath(pwd));
alpha =2.5;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

% x=linspace(0,1000,100);
% % figure;
% plot(x,rbfIQ(x));

load('centerPoints.mat')
load('haltonPoints.mat')

neval =60;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);

epoints = [xe(:) ye(:)];
[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F3, rbfIQ, haltonPoints2000, centerPoints225,epoints);

figure;
surf(xe,ye,reshape(pf_p,neval,neval))




errorPfandPf_p = abs(pf_p -exact)- abs(pf-exact);
figure;
load('colormap')
surf(xe,ye,reshape(errorPfandPf_p,neval,neval));

maxError =max(E(1),E(3));
figure;
fview = [100,30]; % viewing angles for plot
subplot(2,2,1);
PlotSurf(xe,ye,pf,neval,exact,E(1),fview);
subplot(2,2,2);
PlotSurf(xe,ye,pf_p,neval,exact,E(3),fview);
subplot(2,2,3);
PlotError2D(xe,ye,pf,exact,E(1),neval,fview);
subplot(2,2,4);
PlotError2D(xe,ye,pf_p,exact,E(3),neval,fview);
figure;
plot(haltonPoints2000(:,1),haltonPoints2000(:,2),'bo',centerPoints225(:,1),centerPoints225(:,2),'rx')

