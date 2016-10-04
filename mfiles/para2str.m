%% write input parameters into strings
%
%  SYNTAX
%     out = para2str(A, B, C, ...)
%     out = para2str(A, B, C, ..., [L1, L2,...])   
%
%     A, B, C,...   :  parameters with values to print
%     [L1, L2, ...] : the last input argument, should be un-named, 
%                         assigne the number of parameters put in each line.
%  
%  Example:
%   k1 = 1; k2 = 0.1; k3 = 100; r1 = 2; mode = 'S';
%   str1 =  para2str(k1, k2,k3, r1, mode);
 %  str2 = para2str(k1, k2,k3, r1, mode, [3,1,1]);
 %              % this will be printed multi-line in plotting utilities (e.g. title, text, ...)
 %
function out = para2str(varargin)
last = nargin;
if ~isempty(inputname(last)) || last == 1
    L = last; % the default
else
    L = varargin{last};
end

c = 1;
for line = 1 : length(L)
            out{line} = ['' ];
    for i = 1 : L(line)
        out{line} =[ out{line},  inputname(c), ' = ', num2str(varargin{c}), ';  '];
        c = c+1;
    end
end 

