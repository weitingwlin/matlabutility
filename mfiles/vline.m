% Making verticle lines, add to previous figure
%
%  h = hline( x, color, style)
% 
%   color, style : parameters to be passed to funciton myplot
% 
% see also: myplot
function h = vline(x, color, style)

if (nargin < 1||isempty(x)), x = 0 ; end;
if (nargin < 2||isempty(color)), color = 7 ; end;
if (nargin < 3), style = '-'; end;

% xlimits = get(gca,'Xlim');
ylimits = get(gca,'Ylim');

h=myplot([x x],ylimits,'L',color,style);

