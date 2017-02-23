% Associaiton index
%
% SYNTAX :asso_met = association_ind(data, formula)   
%
%       asso_met:  return a "index" metrics, symmetric
%       data:          N X S matrix for N patches/sites and S species
%       (Abundance data will be transformed to presence/absence (1/0) data
%       before processes)
%       formula: the formula used in calculation
%                 [1]: simple ratio; this is the defalt 
function [Pval, CI, med] = association_bootstrap(data, formula, itt)
if (nargin < 2|| isempty(formula)), formula=1; end;
if (nargin < 3), itt = 10000; end;

real = squareform(association_ind(data, formula));
data01 = data > 0; % transfer abundance data in to 1/0 data

[N, S] = size(data);
SS = S*(S-1)/2; % number of combinations
nulls = zeros(itt, SS);
Pval = zeros(1, SS) ;
for i = 1 : itt     
        for s = 1:S
            mockdata(:, s) = data01(randperm(N), s);
        end
        temp = association_ind(mockdata, formula);
        nulls(i,:)= squareform(temp);
end

 CI = quantile(nulls, [0.025 0.975], 1);
 med = nanmedian(nulls,1);
 
 for s =1:SS
    nless = sum( nulls(:, s) < real(1,s ));
    nequal = sum(nulls(:, s) ==  real(1,s ));
    P = (nless + 0.5*nequal) / itt;
    Pval(1,s) = P;
 end
Pval(isnan(med))=nan;