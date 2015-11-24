% show variable names in table
%
% Syntax:
%          out  = tnames(tablein)

function out  = tnames(tablein, names)
if nargin == 1
out = tablein.Properties.VariableNames;
end
if nargin == 2
    tablein.Properties.VariableNames = names;
out = tablein;
end