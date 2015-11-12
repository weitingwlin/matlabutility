% Making horizontal lines, add to previous figure
%
%  h = hline( Y, color, style)
% 
%   color, style : parameters to be passed to funciton myplot
% 
% see also: myplot
function h = hline(Y, color, style)

if (nargin < 2), color = 7 ; end;
if (nargin < 3), style = '-'; end;

xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');

h=myplot(xlimits,[Y Y],'L',color,style);

