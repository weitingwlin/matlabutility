% Making verticle lines, add to previous figure
%
%  h = vline( x, color, style, linewidth)
% 
%   color, style, linewidth : parameters to be passed to funciton myplot
% 
% see also: myplot
function h = vline(x, color, style, linewidth)

if (nargin < 1||isempty(x)), x = 0 ; end;
if (nargin < 2||isempty(color)), color = 7 ; end;
if (nargin < 3), style = '-'; end;
if (nargin < 4 || isempty(linewidth)), linewidth = 2; end;

% xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');

h=myplot([x x],ylimits,'L',color,style, linewidth);

