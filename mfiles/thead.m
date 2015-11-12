% show variable names in table
%
% Syntax:
%          out  = tnames(tablein)

function out  = thead(tablein, r)
if (nargin < 2), r=6; end

out = tablein(1:r,:);