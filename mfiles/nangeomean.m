% Remove NaN and pass to geomean function
% 
% Wei-Ting Lin, 2015/10/29
function out = nangeomean(mat, dim);

if (nargin < 2), dim = 1; end;

% with a vector 
if ~isempty(find(size(mat)==1))
    ind = ~isnan(mat);
    out=geomean(mat(ind));
end
% with a matrix
[n,p] = size(mat);
if isempty(find(size(mat)==1))
    if dim == 1 % calculation by column
        out = NaN(1,p) ;
        for c = 1:p               
                ind = ~isnan(mat(:,c));
                out(c)=geomean(mat(ind,c));             
        end
    end

    if dim==2 % claculation along the rows
             out = NaN(n,1) ;
       for r = 1:n
              ind = ~isnan(mat(r,:));
             out(r)=geoscore(mat(r,ind));  
       end
    end
end