%% Function that "cast" table form data into matrix
% Put each data in a matrix as a variable in a row ("an obseervation"), and column id and row id as two other variables 
% 
%  SYNTAX:
%               [matout, colnames] = castdata(tabin,datain, cols)
%
% input ->    [tabin] :              input table
%               [datain] :             a string, the variable name in tabin, to be filled
%               [cols]:                 a string, the variable name in tabin, as column id
% output -> [matout]:                (np * 3) table
%               [colnames]:             vector, each elements correspond to each column in matout
function [matout, colnames] = tcastdata(tabin,datain, cols)

% count the longest column, number of row needed
R = max(countcats(categorical(tabin{:,cols}))); % number of rows
colnames = unique(tabin{:,cols}(~isnan(tabin{:,cols}))); % column names
C = length(colnames); % number of column
matout = NaN(R,C);

for c = 1: C
      temp = tabin{tabin{:,cols}==colnames(c),datain};
      matout(1:length(temp),c) = temp;% fill the output matrix with data. If groups are uneven, NaN left at the end
end






