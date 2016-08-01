%% Make a nice plot quickly 
% Syntax: myplot(X,Y,type,color, style)
%             [X],[Y]: vectors of data x,y
%             [type]: type of plots 
%                        'S': scaatter plot, the default
%                        'L': line
%                        'B': both
%             [color]: can ba a number or a vector of 3
%                        IF it is a number, selecter of color from [mycolors]
%                        to see color plate, type mycolor(0), or check document
%                               IF it is not round, round part means the color code, 0.5 decimal part
%                               means the marker be hollow
%                        IF it is a vector, it is the color code
%             [style] : line or marker style of corresponding [type]. for type = 'B', apply only to marker
% Update 2015/09/21 : use function form [mycolor] instead of script_mycolorplate 
% Update 2015/09/22 : input [color] can be a 3-number code
% Update 2015/10/30 : set default scatter plot transparency; set output;
%                                 input can be  table
% Update 2015/11/11 : Add optional input 'style' 
% Update 2015/11/23 :  Add option color n.5 for hollow markers
% Update 2015/12/01 : Add numeric and n.5 input option of 'style'; use [] to pass default values
%%
function h = myplot(X,Y,type,color,style)
if (nargin < 4 || isempty(color)), color = 3; end;
if (nargin < 3 ||isempty(type)), type = ('S'); end;

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   hollow = 0; % flag for whether the symbal is hollow
if length(color)==1
    colorcode = mycolor(floor(color));
    if color-floor(color) == 0.5
            hollow = 1;
    end
else if length(color)==3
    colorcode = color;    
    else
        error('input [color] should be an interger (select from [mycolor]) or a 3-number color code')
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if type=='S'
          if (nargin < 5||isempty(style)), style = 'o';       end
          
          stylesheet = {'o', 's','d','^','p','+','*','X','v','>','<','.'};
          a=40;
          if isnumeric(style) 
            if (style-floor(style) == 0.5);  hollow = 1;end  
            style = stylesheet{floor(style)};
          end 
        if hollow == 0  && ~any(strcmp(style,{'+','*','X'}))  % +,*,X cannot be hollow
                if  any( strcmp(version('-release'), {'2015b'}) )
                h = scatter(X,Y,a,style,'Markeredgecolor','none','Markerfacecolor',colorcode,'Markerfacealpha',0.7);% 'Markerfacealpha',0.7);
                else
                h = scatter(X,Y,a,style,'Markeredgecolor','none','Markerfacecolor',colorcode);     
                end
        else % hollow ==1    
                h = plot(X,Y,style,'color',colorcode);   
        end
     set(gca,'FontSize',14,'linewidth',2);   
end

if type=='L'|| type=='B'
        if (nargin < 5||isempty(style)||type=='B')
                Lstyle = '-';
        else
                Lstyle=style;
        end
        
          stylesheet = {'-','--',':','-.' };
          if (isnumeric(Lstyle)), Lstyle = stylesheet{floor(Lstyle)}; end 
        
     h = plot(X,Y,Lstyle,'linewidth',2,'color',colorcode);
     set(gca,'FontSize',14,'linewidth',2);
end

if type=='B'
           if (nargin < 5||isempty(style)), style = 'o';       end
           stylesheet = {'o', 's','d','^','p','+','*','X','v','>','<','.'};
          a=40;
         if isnumeric(style) 
            if (style-floor(style) == 0.5);  hollow = 1;end  
            style = stylesheet{floor(style)};
          end 
     hold on
     if hollow ==0  && ~any(strcmp(style,{'+','*','X'})) 
                if  any( strcmp(version('-release'), {'2015b'}) )
                h = scatter(X,Y,a,style,'Markeredgecolor','none','Markerfacecolor',colorcode,'Markerfacealpha',0.7);% 'Markerfacealpha',0.7);
                else
                h = scatter(X,Y,a,style,'Markeredgecolor','none','Markerfacecolor',colorcode);     
                end
     else
     plot(X,Y,style,'color',colorcode);
     end
     set(gca,'FontSize',14,'linewidth',2);
end
  xlabel(Xlab);ylabel(Ylab);