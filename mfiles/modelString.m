% take model object and return a string representaiton of the model
%
% SYNTAX
%           mdlstring = modelString(mdl, prefix, digit)
% 
%   Example:
%           x1 = rand(20, 1) ;
%           x2 = rand(20, 1) ;
%           y = x1 * 10 + rand(20, 1) * 1 + x2 * 3 - x1 .* x2 * 10;
%           tbl = table(y, x1,x2);
%           lm = fitlm(tbl, 'y ~ x1 + x2 + x1:x2') ;
%   modelString(lm)
%   modelString(lm, '', 3) % no prefix


function mdlstring = modelString(mdl, prefix, digit)
% default values
if nargin < 2||isempty(prefix)
        prefix = 'Y ~ ';
end
if nargin < 3||isempty(digit)
        digit = 2;
end

x = mdl.CoefficientNames;
est = mdl.Coefficients.Estimate;
mdlstring = [prefix  num2str(est(1),2)];
        if length(est) >= 2
                for i = 2 : length(est)
                        if est(i) > 0
                                mdlstring = [mdlstring  ' + ' num2str(est(i), digit) ' (' x{i} ')']; 
                        else
                                mdlstring = [mdlstring  ' - ' num2str(est(i) * (-1), digit)  ' (' x{i} ')']; 
                        end
                end
        end
        
% p = mdls.coefTest;
% R_adj = mdls.Rsquared.Adjusted ;