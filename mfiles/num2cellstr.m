%  convert number vector into cell array of string
%
%   out = num2cellstr(input)
%
function out = num2cellstr(input)

out = [];
for i = 1: length(input)
        out{i}=num2str(i);
end