% Syntax: myplot(X,Y,type,color)
%             [X],[Y]: vectors of data x,y
%             [type]: type of plots 
%                        'S': scaatter plot, the default
%                        'L': line
%             [color]: can ba a number or a vector of 3
%                        IF it is a number, selecter of color from [mycolors]
%                        to see color plate, type mycolor(0), or check document
%                        IF it is a vector, it is the color code
% Update 2015/09/21 : use function form [mycolor] instead of script_mycolorplate 
% Update 2015/09/22 : input [color] can be a 3-number code
% Update 2015/10/30 : set default scatter plot transparency; set output;
%                                 input can be  table
% Update 2015/11/11 : Add optional input 'style' 
%%
function h = myplot(X,Y,type,color,style)
if (nargin < 4), color = 3; end;
if (nargin < 3), type = ('S'); end;

% compatibility to data type table
Xlab = [];   
Ylab = []; 
  if istable(X)
      Xlab = tnames(X);
      X=table2array(X);
  end
  if istable(Y)
      Ylab = tnames(Y);
      Y=table2array(Y);
  end

% script_mycolorplate
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
          if (nargin < 5), style = 'o';       end
 %  H = plot(X,Y,'o','color',colorcode,'Markerfacecolor',colorcode, 'Markerfacealpha',0.2);
     if  strcmp(version('-release'), '2015a')
         h = scatter(X,Y,40,'Markeredgecolor','none','Markerfacecolor',colorcode, 'Markerfacealpha',0.7);
     else
         h = scatter(X,Y,40,style,'Markeredgecolor','none','Markerfacecolor',colorcode);     
     end
     set(gca,'FontSize',14,'linewidth',2);
   
end

if type=='L'|| type=='B'
        if (nargin < 5||type=='B')
                Lstyle = '-';
        else
                Lstyle=style;
        end
     h = plot(X,Y,Lstyle,'linewidth',2,'color',colorcode);
     set(gca,'FontSize',14,'linewidth',2);
end

if type=='B'
           if (nargin < 5), style = 'o';       end
     hold on
     plot(X,Y,style,'color',colorcode,'Markerfacecolor',colorcode);
     set(gca,'FontSize',14,'linewidth',2);
end
  xlabel(Xlab);ylabel(Ylab);