function [Pf,Pf_p,E,exact] = CalculateImpactOfEvaluationPoints(f, rbf, dsites, ctrs, epoints)

DM_data = DistanceMatrix(dsites,ctrs) % Build collocation matrix
CM = rbf(DM_data)
% Create right-hand side vector, i.e.,
% evaluate the test function at the data points.
rhs = f(dsites(:,1),dsites(:,2));
%Create neval-by-neval equally spaced evaluation 7c locations in the unit square
%Compute distance matrix between evaluation points and centers
DM_eval = DistanceMatrix(epoints,ctrs);
EM = rbf(DM_eval);
%Compute RBF least squares approximation
Pf = EM * (CM\rhs);
exact = f(epoints(:,1),epoints(:,2)); % Compute maximum error on evaluation grid

tmp = Pf-exact;
[row,~] = size(tmp);
MAX_Error = max(tmp); % Plots

Mean_Error = (sum(abs(tmp)))/row;

P = polynomialTerm(dsites);
%polynomial reproduction
PM = [CM'*CM , CM'*P ; P'*CM , P'*P];

%right hand side      rhs = h
RHS = [CM'*rhs ; P'*rhs];

eval_P  = polynomialTerm(epoints);

EM = [rbf(DM_eval),eval_P];
Pf_p = EM * (PM\RHS);

MAX_Error_p = max(Pf_p -exact); % Plots
Mean_Error_p = ((sum(abs(Pf_p -exact)))/row);

E = [MAX_Error,Mean_Error,MAX_Error_p,Mean_Error_p];

end


