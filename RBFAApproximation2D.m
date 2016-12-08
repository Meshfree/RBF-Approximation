function RBFAApproximation2D(f, rbf, dsites, ctrs,neval, int, caption)

gridX = linspace(0,1,neval);
gridY = linspace(0,1,neval);
[xe,ye] = meshgrid(gridX,gridY);
epoints = [xe(:) ye(:)];

scrsz = get(groot,'ScreenSize');
figureWidth = 1200;
figureHeight = 600;
figure('name',caption,'position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);

[Pf,Pf_p,E,exact] = CalculateImpactOfEvaluationPoints(f, rbf, dsites, ctrs, epoints);

maxError = max(E(1),E(3));

fview = [100,30]; % viewing angles for plot

sizeDsites = size(dsites);
sizeCtrs = size(ctrs);


subplot(2,3,1);
plot(dsites(:,1),dsites(:,2),'bo',ctrs(:,1),ctrs(:,2),'r+');
title(sprintf('%d Hamilton Points with %d Centers',sizeDsites(1), sizeCtrs(1)));
subplot(2,3,2);
PlotSurf(xe,ye,Pf,neval,exact,E(1),fview);
title('RBF Approximation');
subplot(2,3,3);
PlotError2D(xe,ye,Pf,exact,E(1),neval,fview);
title('Error in RBF Approximation');
subplot(2,3,4);
surf(xe,ye,reshape(exact,neval,neval));
view(fview);
title('Original function');

subplot(2,3,5);
PlotSurf(xe,ye,Pf_p,neval,exact,E(3),fview);
title(sprintf('Proposed RBF Approximation with\n Polynomial Reproduction'),'FontSize',9);
subplot(2,3,6);
PlotError2D(xe,ye,Pf_p,exact,E(3),neval,fview);
title(sprintf('Error of Proposed RBF Approximation\n with Polynomial Reproduction'),'FontSize',9);

end