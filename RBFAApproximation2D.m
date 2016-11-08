function RBFAApproximation2D(testfunction, rbf, dsites, ctrs, neval, int, caption)

scrsz = get(groot,'ScreenSize');
figureWidth = 1200;
figureHeight = 600;
figure('name',caption,'position',[scrsz(3)/2-figureWidth/2 scrsz(4)/2-figureHeight/2 figureWidth figureHeight]);
%Compute distance matrix between data sites and centers
DM_data = DistanceMatrix(dsites,ctrs); % Build collocation matrix
CM = rbf(DM_data);
% Create right-hand side vector, i.e.,
% evaluate the test function at the data points.
rhs = testfunction(dsites(:,1),dsites(:,2));
%Create neval-by-neval equally spaced evaluation 7c locations in the unit square
grid = linspace(int(1),int(2),neval); [xe,ye] = meshgrid(grid);
epoints = [xe(:) ye(:)];
%Compute distance matrix between evaluation points and centers
DM_eval = DistanceMatrix(epoints,ctrs);
EM = rbf(DM_eval);
%Compute RBF least squares approximation
Pf = EM * (CM\rhs);
%Compute exact solution, i.e., evaluate test 7c function on evaluation points
exact = testfunction(epoints(:,1),epoints(:,2)); % Compute maximum error on evaluation grid
maxerr = norm(Pf-exact,inf); % Plots
fview = [100,30]; % viewing angles for plot

sizeDsites = size(dsites);
sizeCtrs = size(ctrs);

subplot(2,3,1);
plot(dsites(:,1),dsites(:,2),'bo',ctrs(:,1),ctrs(:,2),'r+');
title(sprintf('%d Hamilton Points with %d Centers',sizeDsites(1), sizeCtrs(1)));
subplot(2,3,2);
PlotSurf(xe,ye,Pf,neval,exact,maxerr,fview);
title('RBF Approximation');
subplot(2,3,3);
PlotError2D(xe,ye,Pf,exact,maxerr,neval,fview);
title('Error in RBF Approximation');
subplot(2,3,4);
surf(xe,ye,reshape(exact,neval,neval));
view(fview);
title('Original function');

%A = CM ;
P = polynomialTerm(dsites);
%polynomial reproduction
PM = [CM'*CM , CM'*P ; P'*CM , P'*P];

RCONDPM=rcond(PM);
detPM = det(PM);
isPositiveSemidefinite=eig(PM);
%right hand side      rhs = h
RHS = [CM'*rhs ; P'*rhs];

eval_P  = polynomialTerm(epoints);

EM = [rbf(DM_eval),eval_P];
% [q,r] = qr(PM);
% y = q'*RHS;
% x = r\y;
Pf = EM * (PM\RHS);


maxerr = norm(Pf-exact,inf); % Plots

subplot(2,3,5);
PlotSurf(xe,ye,Pf,neval,exact,maxerr,fview);
title(sprintf('Proposed RBF Approximation with\n Polynomial Reproduction'),'FontSize',9);
subplot(2,3,6);
PlotError2D(xe,ye,Pf,exact,maxerr,neval,fview);
title(sprintf('Error of Proposed RBF Approximation\n with Polynomial Reproduction'),'FontSize',9);

end