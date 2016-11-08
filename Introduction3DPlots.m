clc;
close all;
numberOfPoints = 150;

scrsz = get(groot,'ScreenSize');
figureWidth = 800;
figureHeight = 600;

figure('name','Introduction RBFs in Matlab 3','position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);

% x = 0:0.1:1;
% [X,Y] = ndgrid(x,x);
% z = MarschnerLobb(X,Y)


% subplot(2,2,1);

x0 = -50;
xend =50;
gridSize = xend-x0;
X = x0:(gridSize/numberOfPoints):xend;

y0 = -50;
yend =50;
gridSize = yend-y0;
Y = y0:(gridSize/numberOfPoints):yend;

z0 = -1;
zend = 1;
gridSize = zend-y0;
Z = z0:(gridSize/numberOfPoints):zend;

[X,Y,Z] = meshgrid(X,Y,Z);

F = MarschnerLobb(X,Y,Z);

isosurface(X,Y,Z,F);


% subplot(2,2,1);
% surf(X,Y,F);
% title('Peaks X Y');
% axis tight
% 
% figure;
% peaks(64)
% subplot(2,2,2);
% surf(Y,Z,F);
% title('Peaks Y Z');
% 
% subplot(2,2,3);
% surf(X,Z,F);
% title('Peaks X Z');

function z = peakZ(x,y)
z = 3* (1- x).^2 .* exp(- x.^2 - (y + 1).^2) ...
    -10 * (x/5 - x.^3 - y.^5) .* exp( - x.^2 - y.^2)...
    - 1/3 * exp(-(x + 1).^2 - y.^2) ;
end