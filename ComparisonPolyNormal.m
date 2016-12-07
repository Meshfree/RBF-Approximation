close all;
clear variables;
clc;
addpath(genpath(pwd));
alpha = 0.005;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

x=linspace(0,1000,100);
figure;
plot(x,rbfIQ(x));

load('centerPoints.mat')
load('haltonPoints.mat')
unit2DM81 = unitGrid(9);

neval =60;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);
figure;
unit = unitGrid(20);
plot(haltonPoints500(:,1),haltonPoints500(:,2),'bo',unit2DM81(:,1),unit2DM81(:,2),'rx')

figure;
epoints = [xe(:) ye(:)];
[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@franke, rbfG, haltonPoints81, unit2DM81,epoints);
% figure;
% surf(xe,ye,reshape(exact,neval,neval));
% hold on;
% surf(xe*1000,ye*1000,reshape(pf_p,neval,neval))

fview = [100,30]; % viewing angles for plot
PlotSurf(xe*1000,ye*1000,pf,neval,exact,E(1),fview)
figure;
PlotError2D(xe*1000,ye*1000,pf,exact,E(1),neval,fview);

