%  convert cell array of string to numeric
%
%  out = cellstr2num(input)
%

function out = cellstr2num(input)

[n, p] = size(input);
out = nan(n, p);
for i = 1: n
    for j = 1:p
        out(i, j)=str2num(input{i, j});
    end
end