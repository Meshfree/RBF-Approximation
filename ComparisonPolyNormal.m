close all;
clear variables;
clc;
addpath(genpath(pwd));
alpha = 0.004;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

x=linspace(0,1,60);
figure;
plot(x,rbfG(x));


load('haltonPoints.mat')
unit2DM81 = unitGrid(9);

neval =50;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);

figure;
epoints = [xe(:) ye(:)];
[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F1, rbfIQ, unitGrid(20), unit2DM81,epoints);
% figure;
% surf(xe,ye,reshape(exact,neval,neval));
% hold on;
surf(xe*1000,ye*1000,reshape(exact,neval,neval))

% fview = [100,30]; % viewing angles for plot
% PlotSurf(xe,ye,pf,neval,exact,E(1),fview)
% PlotError2D(xe,ye,pf,exact,E(1),neval,fview);

