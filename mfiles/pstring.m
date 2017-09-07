% return p value in string, easy to read
% SYNTAX:
%           function pstr = pstring(p, cutoff, digit , headstr) 
% 
%           p: the numeric p-value
%           cutoff: 
% e.g. 
% p = 0.0000001
function pstr = pstring(p, cutoff, digit , headstr) 
if (nargin  < 2 | isempty(cutoff))
    cutoff = 0.001;
end
if (nargin  < 3 | isempty(digit))
    digit = 2;
end
if (nargin  < 4 | isempty(headstr))
    headstr = 'p ';
end
%%
if p < cutoff
    pstr =[headstr, '< ', num2str(cutoff, digit)];
else
    pstr =[headstr, '= ', num2str(p, digit)];
end