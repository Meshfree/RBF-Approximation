clear variables;
close all;
clc;
addpath(genpath(pwd));
alpha =5;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1./(1 + (alpha* r).^2);

load('centerPoints.mat')
load('haltonPoints.mat')
unit2DM81 = unitGrid(9);

neval =60;
gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);

epoints = [xe(:) ye(:)];
[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@franke, rbfG, haltonPoints500, unit2DM81,epoints);
[pf_e,pf_p_e,E_e,exact_e] = CalculateImpactOfEvaluationPoints(@franke, rbfG, haltonPointsEdges500, unit2DM81,epoints);

% figure;
% surf(xe,ye,reshape(exact,neval,neval));
% hold on;
% surf(xe*1000,ye*1000,reshape(pf_p,neval,neval))
maxError =max(E(1),E_e(1));

figure;
fview = [100,30]; % viewing angles for plot
subplot(2,2,1);
PlotError2D(xe,ye,pf,exact,maxError,neval,fview);
subplot(2,2,2);
PlotError2D(xe,ye,pf_e,exact_e,maxError,neval,fview);
subplot(2,2,3);
surf(xe,ye,reshape(abs(pf-pf_e),neval,neval));


