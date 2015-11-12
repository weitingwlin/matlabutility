% Remove NaN and pass to zscore function
% NaN remain NaN in the out put data 
%
function out = nanzscore(mat, flag,  dim);

if (nargin < 3), dim = 1; end;
if (nargin < 2), flag = 0; end;

out = NaN(size(mat));
% with a vector 
if sum(size(mat)==1)>0
    ind = ~isnan(mat);
    out(ind)=zscore(mat(ind),flag,dim);
end
% with a matrix
[n,p] = size(mat);
if dim==1 % transform by column
        for c = 1:p
                if sum(size(mat(:,c))==1)>0
                ind = ~isnan(mat(:,c));
                out(ind,c)=zscore(mat(ind,c),flag);
                end
        end
end

if dim==2 % transform along the rows
       for r = 1:n
                if sum(size(mat(r,:))==1)>0
                ind = ~isnan(mat(r,:));
                out(ind,r)=zscore(mat(r,ind),flag);
                end
        end
end