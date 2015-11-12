% Syntax: myplot(X,Y,type,color)
%             [X],[Y]: vectors of data x,y
%             [type]: type of plots 
%                        'S': scaatter plot, the default
%                        'L': line
%             [color]: can ba a number or a vector of 3
%                        IF it is a number, selecter of color from [mycolors]
%                        to see color plate, type mycolor(0), or check document
%                        IF it is a vector, it is the color code
% Updated: 2015/09/21 Wei-Ting Lin
%                 Note: use function form [mycolor] instead of script_mycolorplate 
% Updated: 2015/09/22 Wei-Ting Lin
%               input [color] can be a 3-number code
%%
function myplot(X,Y,type,color)
if (nargin < 4), color = 3; end;
if (nargin < 3), type = ('S'); end;
%script_mycolorplate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if length(color)==1
    colorcode = mycolor(color);
else if length(color)==3
    colorcode = color;    
    else
        error('input [color] should be an interger (select from [mycolor]) or a 3-number color code')
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if type=='S'
    plot(X,Y,'o','color',colorcode,'Markerfacecolor',colorcode)
     set(gca,'FontSize',14,'linewidth',2)
end

if type=='L'
    plot(X,Y,'linewidth',2,'color',colorcode)
     set(gca,'FontSize',14,'linewidth',2)
end
