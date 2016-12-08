
clear variables;
clc;
addpath(genpath(pwd));


load('centerPoints.mat')
load('haltonPoints.mat')




alpha = 2.0;
rbfG = @(r) exp(-(alpha*r).^2); 
rbfIQ = @(r) 1 ./(1 + (alpha* r).^2);
rbfIMQ = @(r) 1 ./sqrt(1 + (alpha* r).^2);
rbfMQ = @(r) sqrt(1 + (alpha* r).^2);
rbfTPS = @ (r) (alpha * r).^2 .* log(alpha * r);



%RBFAApproximation2D(testfunction,rbfG,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(@F3,rbfG,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfIMQ,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfMQ,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfTPS,halton(k,2),unitGrid(sqrt(M)),neval);
intDefault = [0,1];
int_n2_2 = [-2,2];
halton2Dk5_n2_2 = calcIntervall(haltonPoints1000, int_n2_2,int_n2_2);
unit2DM81_n2_2 = calcIntervall(centerPoints225, int_n2_2,int_n2_2);

int_n1_1 = [-1,1];
halton2Dk5_n1_1 = calcIntervall(haltonPoints1000, int_n1_1,int_n1_1);
unit2DM81_n1_1 = calcIntervall(centerPoints225, int_n1_1,int_n1_1);





RBFAApproximation2D(@F4,rbfIQ,haltonPoints2000,centerPoints225,60, intDefault, sprintf('F1 QI RBF, Halton k=%d, alpha=%d', 2000, alpha));
% 
% RBFAApproximation2D(@F2,rbfG,haltonPoints1000,centerPoints225,neval, intDefault, sprintf('F2 Gauss RBF, Halton k=%d, alpha=%d', 1000, alpha));
% RBFAApproximation2D(@F3,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F3 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F4,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F4 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F5,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F5 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F6,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F6 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F7,rbfG,halton2Dk5_n1_1,unit2DM81_n1_1,neval, int_n1_1, sprintf('F7 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F8,rbfG,halton2Dk5_n2_2,unit2DM81_n2_2,neval, int_n2_2, sprintf('F8 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F9,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F9 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F10,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F10 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));
% RBFAApproximation2D(@F11,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F11 Gauss RBF, Halton k=%d, alpha=%d', k, alpha));

% numberOfImpactPoints =10;
% numberOfCenterPoints =10; 
% 
% centerOffset = 10;
% centerSteps = 10;
% steps = 10;
% pointOffset = 100;
% 
% E = zeros(numberOfImpactPoints,4);
% points = zeros(numberOfImpactPoints/steps,1);
% 
% 
% 
% for m= 1:1:numberOfCenterPoints
%     
%     
% grid = unitGrid(centerOffset + m* centerSteps);
% centers = ones(numberOfImpactPoints,1) * centerOffset + m* centerSteps;
% 
% for i = 1:1:numberOfImpactPoints
% 
%     haltons = haltonseq(i*steps+ pointOffset,2);
%         [E1,E2,E3,E4] = CalculateImpactOfEvaluationPoints(@F1,rbfG,haltons,grid,neval, intDefault);
%     E(i,1) = E1;
%     E(i,2) = E2;
%     E(i,3) = E3;
%     E(i,4) = E4;
%     points(i,1) = i*steps+ pointOffset;
%        
% end
% 
% hold on;
% plot3(points*steps,centers,E(:,1))
% plot3(points*steps,centers,E(:,2))
% plot3(points*steps,centers,E(:,3))
% plot3(points*steps,centers,E(:,4))
% legend('Max PP','Mean PP','Max_PP p','Mean PP p')
% 
% end



numberOfImpactPoints =5;
numberOfCenterPoints =50; 

% centerOffset = 10;
% centerSteps = 10;

pointOffset = 200;
pointEnd = 500;
standardIntv = [pointOffset,numberOfImpactPoints,pointEnd];


% 
% [E1,N1] = getErrorMatrix(@F1,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% [E2,N2] =getErrorMatrix(@F2,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% [E3,N3] =getErrorMatrix(@F3,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% [E4,N4] =getErrorMatrix(@F4,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% [E5,N5] =getErrorMatrix(@F5,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% [E6,N6] =getErrorMatrix(@F6,rbfG,neval,intDefault,haltonPoints1000,centerPoints225);
% 
% % [E7,N7] =getErrorMatrix(@F7,rbfG,neval, int_n1_1,standardIntv);
% % [E8,N8] =getErrorMatrix(@F8,rbfG,neval, int_n2_2,standardIntv);
% % [E9,N9] =getErrorMatrix(@F9,rbfG,neval, intDefault,standardIntv);
% % [E10,N10] =getErrorMatrix(@F10,rbfG,neval, intDefault,standardIntv);
% % [E11,N11] =getErrorMatrix(@F11,rbfG,neval, intDefault,standardIntv);
% 
% 
% scrsz = get(groot,'ScreenSize');
% figureWidth = 1200;
% figureHeight = 600;
% caption = 'Normal RBF Approximation';
% figure('name',caption,'position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);
% 
% 
% subplot(1,2,1);
% grid on;
% axis on;
% 
% loglog(N1,E1(:,1),N2,E2(:,1),N3,E3(:,1),N4,E4(:,1),N5,E5(:,1),N6,E6(:,1),N7,E7(:,1),N8,E8(:,1),N9,E9(:,1),N9,E9(:,1),N10,E10(:,1),N11,E11(:,1));
% 
% title('Max Error per point');
% legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');
% 
% 
% subplot(1,2,2);
% grid on;
% axis on;
% 
% loglog(N1,E1(:,2),N2,E2(:,2),N3,E3(:,2),N4,E4(:,2),N5,E5(:,2),N6,E6(:,2),N7,E7(:,2),N8,E8(:,2),N9,E9(:,2),N9,E9(:,2),N10,E10(:,2),N11,E11(:,2));
% 
% title('Mean Error per point');
% legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% caption = 'RBF Approximation with polynomial reproduction';
% figure('name',caption,'position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);
% 
% subplot(1,2,1);
% grid on;
% axis on;
% loglog(N1,E1(:,3),N2,E2(:,3),N3,E3(:,3),N4,E4(:,3),N5,E5(:,3),N6,E6(:,3),N7,E7(:,3),N8,E8(:,3),N9,E9(:,3),N9,E9(:,3),N10,E10(:,3),N11,E11(:,3));
% 
% legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');
% 
% 
% subplot(1,2,2);
% grid on;
% axis on;
% 
% loglog(N1,E1(:,4),N2,E2(:,4),N3,E3(:,4),N4,E4(:,4),N5,E5(:,4),N6,E6(:,4),N7,E7(:,4),N8,E8(:,4),N9,E9(:,4),N9,E9(:,4),N10,E10(:,4),N11,E11(:,4));
% 
% legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');
% 

%RBFAApproximation2D(@Peaks,rbfG,halton2Dk5,unit2DM81,neval, intDefault);