% convert variable name to string
function Xname = name2str(X,varargin)

for i=1: nargin
        Xname{i} = inputname(i);
end
% one input return one string
if nargin == 1
        Xname = Xname{1};
end