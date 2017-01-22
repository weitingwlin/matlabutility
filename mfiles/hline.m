% Making horizontal lines, add to previous figure
%
%  h = hline( Y, color, style , linewidth)
% 
%   color, style, linewidth : parameters to be passed to funciton myplot
% 
% see also: myplot
function h = hline( y, color, style, linewidth )

if (nargin < 1 || isempty( y ) ), y = 0 ; end;
if (nargin < 2 || isempty( color ) ), color = 7 ; end;
if (nargin < 3 ), style = '-'; end;
if (nargin < 4 || isempty(linewidth)), linewidth = 2; end;

xlimits = get( gca, 'Xlim' );
ylimits = get( gca, 'Ylim' );

h = myplot( xlimits, [y y], 'L', color, style,  linewidth  );

