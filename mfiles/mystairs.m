function h = mystairs(X, Y,  color, style)
if (nargin < 3 || isempty(color)), color = 3; end;
%% table application
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
%% color
if length(color)==1
    colorcode = mycolor(floor(color));
else if length(color)==3
    colorcode = color;    
    else
        error('input [color] should be an interger (select from [mycolor]) or a 3-number color code')
    end
end
%%
  xlabel(Xlab);  ylabel(Ylab);
  if (nargin < 4||isempty(style))
                Lstyle = '-';
        else
                Lstyle=style;
  end
%%
 h = stairs(X, Y, Lstyle,'linewidth', 1,'color',colorcode);
    set(gca,'FontSize',14,'linewidth',2);