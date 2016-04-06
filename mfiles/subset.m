% select data in a vector or array
%  `subset(X, ind1, ind2)`  do the same thing as  X(ind1, ind2) 
%  
% input: ind1, ind2, ind3
%       use [] or ':' instead of : as index for "all"
%       use string for non-numerical input: e.g. '2:end'
%       
function out = subset(X, ind1, ind2, ind3) 
nind = nargin; % number of index

% X(ind1)
if nind == 2
        if isempty(ind1)
                ind1 = ':';
        end
       out = eval(['X(' num2str(ind1) ')']);
end
% X(ind1, ind2)
if nind == 3
        if isempty(ind1)
                ind1 = ':';
        end
        if isempty(ind2)
                ind2 = ':';
        end
          out = eval(['X(' num2str(ind1) ',' num2str(ind2) ')']);
end
% X(ind1, ind2, ind3)
if nind == 4
        if isempty(ind1)
                ind1 = ':';
        end
        if isempty(ind2)
                ind2 = ':';
        end
         if isempty(ind3)
                ind3 = ':';
        end
         out = eval(['X(' num2str(ind1) ',' num2str(ind2) ',' num2str(ind3) ')']);
end