% Syntax: 
%            myplotyy (X1,Y1,X2,Y2, type1, type2,  color1, color2)
%            
%            [Hax,H1,H2] = myplotyy (X1,Y1,X2,Y2, type1, type2,  color1, color2)
%----------------------------------------------------------------------------------------
%             [X1],[Y1],[X2],[Y2]: vectors of data x,y, array or table column;
%                                           default for X2 is equal ti X1, default for X1 is 1:n
%                                           vector that match Y1.
%             [type1], [type2]: type of plots 
%                                    'S': scaatter plot, the default
%                                     'L': line
%             [color1], [color2]: a number , selecter of color from [mycolors]
%                                        to see color plate, type mycolor, or check document
%                                        Default is 3,2 for blue, red
%                                        if only color1 specified, default color2 = color1-1
%
% update 2015/10/31: 
function [Hax,H1,H2] = myplotyy(X1,Y1,X2,Y2, type1, type2,  color1, color2)
%% set defaults
if (nargin < 7), color1 = 3; color2 = 2;  end;
if (nargin == 7) 
    if color1~=1
        color2 = color1-1;
    else
        color2 = 2;
    end
end;

if (nargin < 5), type1 = ('S'); end;
if (nargin < 6), type2 =type1 ; end;

if (isempty(X1)),X1=[1:height(Y1)]; end; % myplotyy( [], Y1, [], Y2 )
                                                          % another usage
if (isempty(X2)),X2=X1; end; % myplotyy( X1, Y1, [], Y2 )
%% dealing with table
Xlab1 = []; Xlab2 = [];
if istable(X1)
    Xlab1 = tnames(X1);
    X1 = table2array(X1);
end
if istable(X2)
    Xlab2 = tnames(X2);
    X2 = table2array(X2);
end
Ylab1 = [];
if istable(Y1)
    Ylab1 = tnames(Y1);
    Y1 = table2array(Y1);
end
Ylab2 = [];
if istable(Y2)
    Ylab2 = tnames(Y2);
    Y2 = table2array(Y2);
end
%%
subplot(5,1,1:4)
[Hax,H1,H2] = plotyy(X1,Y1,X2,Y2); hold on
%
if type1 == 'L'
        set(H1,'linestyle','-','Color',mycolor(color1),'Markerfacecolor',mycolor(color1)) 
else 
 set(H1,'linestyle','none','Marker','o','Color',mycolor(color1),'Markerfacecolor',mycolor(color1))
    if type1 ~='S'
     message('type should be "L" or "S"; default is "S" ')
     end
end

if type2 == 'L'
        set(H2,'linestyle','-','Color',mycolor(color2),'Markerfacecolor',mycolor(color2)) 
else 
 set(H2,'linestyle','none','Marker','o','Color',mycolor(color2),'Markerfacecolor',mycolor(color2))
    if type2 ~='S'
     message('type should be "L" or "S"; default is "S" ')
     end
end
    set(Hax(1),'ycolor',mycolor(color1), 'linewidth',2)
    set(Hax(2),'ycolor',mycolor(color2),'linewidth',2)
    set(Hax,'FontSize',14)
%% grab labels from table variable names
 if ~isempty([Xlab1 Xlab2])
        if strcmp(Xlab1, Xlab2)
            Xlab = Xlab1;
        else
            Xlab = strjoin([Xlab1 '; ' Xlab2]);
        end
     xlabel(Xlab )
 end
  if ~isempty(Ylab1)
       ylabel(Hax(1),Ylab1)
  end
  if ~isempty(Ylab1)
     ylabel(Hax(2),Ylab2)
 end

    