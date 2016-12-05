function [MAX_PP,Mean_PP,MAX_PP_p,Mean_PP_p] = CalculateImpactOfEvaluationPoints(testfunction, rbf, dsites, ctrs, neval, int)
[N,~]= size(dsites);

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
exact = testfunction(epoints(:,1),epoints(:,2)); % Compute maximum error on evaluation grid

tmp = Pf-exact;
[row,~] = size(tmp);
MAX_PP = max(tmp)/N; % Plots

Mean_PP = (sum(abs(tmp)))/row/N;

P = polynomialTerm(dsites);
%polynomial reproduction
PM = [CM'*CM , CM'*P ; P'*CM , P'*P];

%right hand side      rhs = h
RHS = [CM'*rhs ; P'*rhs];

eval_P  = polynomialTerm(epoints);

EM = [rbf(DM_eval),eval_P];
Pf = EM * (PM\RHS);

MAX_PP_p = max(Pf-exact)/N; % Plots

Mean_PP_p = ((sum(abs(Pf-exact)))/row)/N;


end


