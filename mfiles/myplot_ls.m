% Make scatter plot and ls line
% 
% Syntax:
%        h = myplot_ls(X,Y,pointcolor, linecolor) 
%   
%       X,Y  : input data vector, can be columns in a table;
%               for table input, variable names will be passed as labels
%       pointcolor, linecolor :  can ba a number or a vector of 3 (type "mycolor" for plate)
%                                       color code to be passed to
%                                       [myplot.m]
% 
% going to replace [plot_linefit.m] and [LS_combo.m]
%
% depend on [myplot.m] [mycolor.m] [nanls.m] [tnames.m]
%
function h = myplot_ls(X,Y,pointcolor, linecolor) 

 [BS,R,P] = nanls(X,Y);

if (nargin < 3), linecolor = 3; pointcolor = 1;  end;
if (nargin == 3) 
    if pointcolor == 3
        linecolor =1;
    else
       linecolor = 1;
    end
end;

myplot(X,Y,'S',pointcolor); hold on
            temp = xlim;
    Xhat = linspace(temp(1),temp(2),10);
    Yhat = BS(1)+BS(2).*Xhat;
title(['R = ' num2str(R) '; p = ' num2str(P) ])
myplot(Xhat,Yhat,'L',linecolor);

% grab labels from table 
if istable(X)
     xlabel(X.Properties.VariableNames)
end
if istable(Y)
     ylabel(Y.Properties.VariableNames)
end
