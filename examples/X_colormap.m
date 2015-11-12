%% My color plates
% Printing out color maps for my color plates: *[my_colorplate.mat]*
% 
% This is also an example of usage. 
%
% _Wei-Ting Lin 2014/10/12_
%
% _The file is formmatted to be published (using the publish function in
% matlab)_
%% Load the color plate
load my_colorplates
%% mycolor: a rather discrete color plate
% * This color map can be used to present catagorical variables
% * Since they are numbered, can be incorporated in a _for_ loop
[n,p] = size(mycolor);
figure
for c = 0:n-1
  plot([0 cos(0.15*c)],[0 sin(0.15*c)],'Linewidth',3,'color',mycolor(c+1,:));hold on
  text(cos(0.15*c)*1.05,sin(0.15*c)*1.05,num2str(c+1))
 end
 axis([-1.1 1.1 -1.1 1.1])
 axis off
%% mygrays: a gray-scale color plate
% * This color map can be used to present data with order
 figure
  [n,p] = size(mygrays);
 for c = 0:n-1
  plot([0 cos(0.2*c)],[0 sin(0.2*c)],'Linewidth',3,'color',mygrays(c+1,:));hold on
  text(cos(0.2*c)*1.05,sin(0.2*c)*1.05,num2str(c+1));
 end
 axis([-1.1 1.1 -1.1 1.1])
 axis off
%% myredblues: a red-blue colorplate
% * This colormap con be used to present gradients with two poles.
% * used in [mycorrplot_1]
figure
for c = 0:63
 plot([0 cos(0.098*c)],[0 sin(0.098*c)],'Linewidth',3,'color',myredblues(c+1,:));hold on
text(cos(0.098*c)*1.05,sin(0.098*c)*1.05,num2str(c+1));
 end
axis([-1.1 1.1 -1.1 1.1])
axis off