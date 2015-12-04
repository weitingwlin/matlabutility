% Making horizontal lines, add to previous figure
%
%  h = hline( Y, color, style)
% 
%   color, style : parameters to be passed to funciton myplot
% 
% see also: myplot
function h = hline(y, color, style)

if (nargin < 1||isempty(y)), y = 0 ; end;
if (nargin < 2||isempty(color)), color = 7 ; end;
if (nargin < 3), style = '-'; end;

xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');

h=myplot(xlimits,[y y],'L',color,style);

