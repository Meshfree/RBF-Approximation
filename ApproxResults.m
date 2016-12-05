close all;
clear variables;
clc;

ep = 4;
rbfG = @(r) exp(-(ep*r).^2); 
rbfIQ = @(r) 1 ./(1 + (ep* r).^2);
rbfIMQ = @(r) 1 ./sqrt(1 + (ep* r).^2);
rbfMQ = @(r) sqrt(1 + (ep* r).^2);
rbfTPS = @ (r) (ep * r).^2 .* log(ep * r);


testfunction = @(x,y) sinc(x).*sinc(y);

k = 4;
M = 200;
neval = 60;
intDefault = [0,1];

%RBFAApproximation2D(testfunction,rbfG,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(@F3,rbfG,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfIMQ,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfMQ,halton(k,2),unitGrid(sqrt(M)),neval);
%RBFAApproximation2D(testfunction,rbfTPS,halton(k,2),unitGrid(sqrt(M)),neval);

halton2Dk5 = halton(k,2);
unit2DM81 = unitGrid(sqrt(81));
int_n2_2 = [-2,2];
halton2Dk5_n2_2 = calcIntervall(halton2Dk5, int_n2_2);
unit2DM81_n2_2 = calcIntervall(unit2DM81, int_n2_2);

int_n1_1 = [-1,1];
halton2Dk5_n1_1 = calcIntervall(halton2Dk5, int_n1_1);
unit2DM81_n1_1 = calcIntervall(unit2DM81, int_n1_1);





% RBFAApproximation2D(@F1,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F1 Gauss RBF, Halton k=%d, ep=%d', k, ep));

% RBFAApproximation2D(@F2,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F2 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F3,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F3 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F4,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F4 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F5,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F5 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F6,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F6 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F7,rbfG,halton2Dk5_n1_1,unit2DM81_n1_1,neval, int_n1_1, sprintf('F7 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F8,rbfG,halton2Dk5_n2_2,unit2DM81_n2_2,neval, int_n2_2, sprintf('F8 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F9,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F9 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F10,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F10 Gauss RBF, Halton k=%d, ep=%d', k, ep));
% RBFAApproximation2D(@F11,rbfG,halton2Dk5,unit2DM81,neval, intDefault, sprintf('F11 Gauss RBF, Halton k=%d, ep=%d', k, ep));

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

pointOffset = 500;
pointEnd = 1000;
standardIntv = [pointOffset,numberOfImpactPoints,pointEnd];



[E1,N1] = getErrorMatrix(@F1,rbfG,neval, intDefault,standardIntv);

[E2,N2] =getErrorMatrix(@F2,rbfG,neval, intDefault,standardIntv);

[E3,N3] =getErrorMatrix(@F3,rbfG,neval, intDefault,standardIntv);

[E4,N4] =getErrorMatrix(@F4,rbfG,neval, intDefault, standardIntv);

[E5,N5] =getErrorMatrix(@F5,rbfG,neval, intDefault, standardIntv);

[E6,N6] =getErrorMatrix(@F6,rbfG,neval, intDefault, standardIntv);

[E7,N7] =getErrorMatrix(@F7,rbfG,neval, int_n1_1,standardIntv);
[E8,N8] =getErrorMatrix(@F8,rbfG,neval, int_n2_2,standardIntv);
[E9,N9] =getErrorMatrix(@F9,rbfG,neval, intDefault,standardIntv);
[E10,N10] =getErrorMatrix(@F10,rbfG,neval, intDefault,standardIntv);
[E11,N11] =getErrorMatrix(@F11,rbfG,neval, intDefault,standardIntv);


figure;
subplot(2,1,1);
hold on;
grid on;
axis on;
loglog(N1,E1(:,1),N2,E2(:,1),N3,E3(:,1),N4,E4(:,1),N5,E5(:,1),N6,E6(:,1),N7,E7(:,1),N8,E8(:,1),N9,E9(:,1),N9,E9(:,1),N10,E10(:,1),N11,E11(:,1));
% plot(N1,E1(:,3),N2,E2(:,3),N3,E3(:,3),N4,E4(:,3),N5,E5(:,3),N6,E6(:,3));
title('Max Error per point');
legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');




subplot(2,1,2);
hold on;
grid on;
axis on;

loglog(N1,E1(:,2),N2,E2(:,2),N3,E3(:,2),N4,E4(:,2),N5,E5(:,2),N6,E6(:,2),N7,E7(:,2),N8,E8(:,2),N9,E9(:,2),N9,E9(:,2),N10,E10(:,2),N11,E11(:,2));
title('Mean Error per point');

% plot(AllFunctionN,AllFunctionErrors(:,4));
legend('f1','f2','f3','f4','f5','f6','f7','f8','f9','f10','f11');
% legend('Mean Error per point','Mean Error per point (polynomial)');




%RBFAApproximation2D(@Peaks,rbfG,halton2Dk5,unit2DM81,neval, intDefault);