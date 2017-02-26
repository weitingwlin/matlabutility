% ploting a square or box by imput x and y points
% e.g.
%  xx=[1 2];yy=[3,4];plot_square(xx,yy)
%  axis([0 3 2 5 ])

function myplot_square(x, y, color, style, linewidth)
%% default values
if nargin < 3
    color =1;
end
if nargin < 4
    style = '-';
end
if nargin < 5
    linewidth = 2;
end
%% plot using myplot
myplot([x(1) x(2) x(2) x(1) x(1)],[y(1), y(1) y(2) y(2) y(1)], 'L',color, style, linewidth); 
