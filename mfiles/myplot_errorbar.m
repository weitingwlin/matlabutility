%% work like the built-in function errorbar, but with more control
% 
%  SYNTAX
%            myplot_errorbar(midvalues, STEs, ERstyle)
%   
%       midvalues: mid value (usually mean) of data
%       STEs: the error (usually SE of data)
%       ERstyle: A structure of 3 fields; style parameters; default values 
%               lincolor: [0 0 0] % black 
%               linewidth: 4
%               headlength: 0
%
%  Example:
%     M=1:3;
%     SEs = [0.1 0.2 0.2]
%     myplot_errorbar(M, SEs)
%
%     (used in myplot_bar)
%
function myplot_errorbar(midvalues, STEs, ERstyle)

if (nargin < 3), ERstyle = struct([]); end; 
 
  
%% default styles
  if ~isfield(ERstyle,'lincolor')
      ERstyle = struct('lincolor',mycolor(1)); % default is black
  end
  
  if ~isfield(ERstyle,'headlength')
       ERstyle.headlength = 0; % Only bar, no head ( l not I )
  end
  
    if ~isfield(ERstyle,'linewidth')
       ERstyle.linewidth = 4; % Line width 
    end
 %% 
 for i = 1:length(midvalues) 
     plot([i,i], [midvalues(i) + STEs(i), midvalues(i) - STEs(i)], 'Color',  ERstyle.lincolor, 'LineWidth', ERstyle.linewidth);
     hold on
 end
 
 if ERstyle.headlength ~= 0
     hb = ERstyle.headlength/2; % half bar length
      for i = 1:length(midvalues) 
            plot([i -  hb, i + hb], [midvalues(i) + STEs(i), midvalues(i) + STEs(i)], 'Color',  ERstyle.lincolor, 'LineWidth', ERstyle.linewidth);
            plot([i -  hb, i + hb], [midvalues(i) - STEs(i), midvalues(i) - STEs(i)], 'Color',  ERstyle.lincolor, 'LineWidth', ERstyle.linewidth);
      end
 end
 
 