%% Colomn by column covarience
% 
%   SYNTAX : 
%                 covs = covcc(X1,X2)
%
%    X1, X2 :  input matrix, size n x p
%    covs : vector, length p, element i  is the covarience between column i in X1 and  column i in X2
%
function covs = covcc(X1,X2)
    if ~all(size(X1)==size(X2))
        error('X1 and X2 should have same sizes');
    end

    [n, p] = size(X1);
    covs = zeros(1,p); % empty sheet
    for i=1:p 
            temp = cov(X1(:,i),X2(:,i));
          covs(i) = temp(2); 
    end
end