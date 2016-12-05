close all;
clear variables;
clc;

alpha = 0.005;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1 ./(1 + (alpha* r).^2);

load('haltonPoints.mat')
unit2DM81 = unitGrid(9);

neval = 50;
grid = linspace(0,1000,neval); [xe,ye] = meshgrid(grid);
epoints = [xe(:) ye(:)];

[pf,pf_p,E,exact] = CalculateImpactOfEvaluationPoints(@F1, rbfIQ, haltonPoints81, unit2DM81,epoints);

fview = [100,30]; % viewing angles for plot
PlotSurf(xe,ye,pf,neval,exact,E(1),fview)

