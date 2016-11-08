clc;
close all;

subPlotColumnSize = 2;
subPlotRowSize = 2;

x0 = 0;
numberOfPoints = 50;
gridSize = 1;
%create a numberOfPoints from grid size and and start x0
pts = (x0:numberOfPoints)/(numberOfPoints/gridSize);
[X,Y] = ndgrid(pts,pts);

scrsz = get(groot,'ScreenSize');
figureWidth = 800;
figureHeight = 600;
figure('name','Introduction RBFs in Matlab','position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);

subplot(subPlotRowSize,subPlotColumnSize,1);
Z = F3(X,Y);
surf(X,Y,Z);
title('F3');

subplot(subPlotRowSize,subPlotColumnSize,2);
Z = F5(X,Y);
surf(X,Y,Z);
title('F5');

x0 = -1;
xend = 1;
gridSize = xend-x0;

X = x0:(gridSize/numberOfPoints):xend;
[X,Y] = ndgrid(X)

subplot(subPlotRowSize,subPlotColumnSize,3);
Z = F7(X,Y);
surf(X,Y,Z);
title('F7');


x0 = 0;
xend = 1;
gridSize = xend-x0;

X = x0:(gridSize/numberOfPoints):xend;
[X,Y] = ndgrid(X);

subplot(subPlotRowSize,subPlotColumnSize,4);
Z = F9(X,Y);
surf(X,Y,Z);
title('F9');

figure('name','Introduction RBFs in Matlab 2','position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);
subplot(2,2,1);
x0 = -7;
xend = 7;
gridSize = xend-x0;
X = x0:(gridSize/numberOfPoints):xend
[X,Y] = ndgrid(X);
Z = F11(X,Y);
surf(X,Y,Z);
title('F11');


