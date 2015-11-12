% ploting a square or box by imput x and y points
% e.g.
%  xx=[1 2];yy=[3,4];plot_square(xx,yy)
%  axis([0 3 2 5 ])

function plot_square(x,y)
plot([x(1) x(2)],[y(1), y(1)], '-k','LineWidth',2);hold on
plot([x(1) x(2)],[y(2), y(2)], '-k','LineWidth',2)
plot([x(1) x(1)],[y(1), y(2)], '-k','LineWidth',2)
plot([x(2) x(2)],[y(1), y(2)], '-k','LineWidth',2)