%% Function that "melt" matrix form data into table
% Put each data in a matrix as a variable in a row ("an obseervation"), and column id and row id as two other variables 
% 
%  SYNTAX:
%               out = meltdata(mat, columnname, rowname, varnames)
%
% input ->    [mat] :              n * p matrix, to full the "value" parameter
%               [columnname] :  p * 1 vector, to fill the value of "cols" parameter
%               [rowname] :       n * 1 vector,                            "rows" 
%               [varnames]:       cell array of strings, three element, default is {'cols' 'rows' 'value'}
% output -> [out]:                (np * 3) table
function out = meltdata(mat, columnname, rowname, varnames)

[n,p]=size(mat);

if (nargin < 4), varnames = {'cols' 'rows' 'value'}; end;
if (nargin < 3), rowname = [1:n]; end;
if (nargin < 2), columnname = [1:p]; end;
% initialization
    A = zeros(1,n*p);
    B(1)=columnname(1);
    C(1)=rowname(1);
inn=0;  % innitial localtion of data in melted{1}
for i=1:p
      A(inn+1:inn+n) = mat(:,i);  
        B(inn+1:inn+n) = columnname(i);  
        C(inn+1:inn+n) = rowname;  
        inn = inn+n; %up date    
end

melttab = table(B', C',A','VariableNames',varnames);
out = melttab;
