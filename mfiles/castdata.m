%% Function that "cast" vector form data into matrix by group
% Put each data in a matrix as a variable in a row ("an obseervation"), and column id and row id as two other variables 
% 
%  SYNTAX:
%               [matout, colnames] = castdata(tabin,datain, cols)
%
% input ->    [datain] :             a vector, to be filled
%               [cols]:                 a vector, same size as [datain], as column id
% output -> [matout]:                (np * 3) table
%               [colnames]:             vector, each elements correspond to each column in matout
function [matout, colnames] = castdata(datain, cols)



% count the longest column, number of row needed
R = max(countcats(categorical(cols))); % number of rows
colnames = categories(categorical(cols)); % column names
C = length(colnames); % number of column
matout = NaN(R,C);

for c = 1: C
      temp = datain(categorical(cols)==colnames(c));
      matout(1:length(temp),c) = temp;% fill the output matrix with data. If groups are uneven, NaN left at the end
end






