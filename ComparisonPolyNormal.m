close all;
clear variables;
clc;
addpath(genpath(pwd));
alpha =5;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

% x=linspace(0,1000,100);
% figure;
% plot(x,rbfIQ(x));

load('centerPoints.mat')
load('haltonPoints.mat')
unit2DM81 = unitGrid(9);

neval =60;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);

% epoints = [xe(:) ye(:)];
% [pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@franke, rbfG, haltonPoints4225, unit2DM81,epoints);

% figure;
% surf(xe,ye,reshape(exact,neval,neval));
% hold on;
% surf(xe*1000,ye*1000,reshape(pf_p,neval,neval))


% maxError =max(E(1),E(3));
% 
% errorPfandPf_p = abs(pf_p -exact)- abs(pf-exact);
% figure;
% load('colormap')
% surf(xe,ye,reshape(errorPfandPf_p,neval,neval));
% colormap (mycmap)


% 
% figure;
% fview = [100,30]; % viewing angles for plot
% subplot(2,2,1);
% PlotSurf(xe,ye,pf,neval,exact,maxError,fview);
% subplot(2,2,2);
% PlotSurf(xe,ye,pf_p,neval,exact,maxError,fview);
% subplot(2,2,3);
% PlotError2D(xe,ye,pf,exact,maxError,neval,fview);
% subplot(2,2,4);
% PlotError2D(xe,ye,pf_p,exact,maxError,neval,fview);

e = epsilon(20)

plot(e(:,1),e(:,2),'o')

