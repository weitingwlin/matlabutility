%% Make scatter plot and ls line
% 
% Syntax:
%        h = myplot_ls(X,Y, opt, pointcolor, linecolor) 
%   
%       X,Y  : input data vector, can be columns in a table;
%               for table input, variable names will be passed as labels
%       opt   : 'removeZZ'  --> remove double zero;
%                 [] or 'null'   --> default
%       pointcolor, linecolor :  can ba a number or a vector of 3 (type "mycolor" for plate)
%                                       color code to be passed to
%                                       [myplot.m]
% 
% going to replace [plot_linefit.m] and [LS_combo.m]
%
% depend on [myplot.m] [mycolor.m] [nanls.m] [tnames.m]
%
function [h, Rout, Pout] = myplot_ls(X, Y, opt, pointcolor, linecolor) 

 
if (nargin < 3 || isempty(opt)),  opt = 'null';  end;
if (nargin < 4), linecolor = 3; pointcolor = 1;  end;
if (nargin == 4) 
    if pointcolor == 3
        linecolor =1;
    else
       linecolor = 1;
    end
end;
%%%%%%%%%%%%%%%%%%
if any(strcmp(opt, {'removeZZ', 'remove00'})) % remove "double zero"
        if length(X(:,1))==1 % if input is a row
                X = X'; % change direction
                Y = Y';
        end
        ind = any([X, Y] ~= 0, 2);
        X = X(ind);
        Y = Y(ind);
end
%%%%%%%%%%%%%%%%%%
 [BS,R,P] = nanls(X,Y);
 
h = myplot(X,Y,'S',pointcolor); hold on
            temp = xlim;
    Xhat = linspace(temp(1),temp(2),10);
    Yhat = BS(1)+BS(2).*Xhat;
    if P >= 0.001 
        titlestring = ['R = ' num2str(R,2) '; p = ' num2str(P,2) '; n = ' num2str(length(X)) ];
    else
         titlestring = ['R = ' num2str(R,2) '; p < 0.001; n = ' num2str(length(X)) ];
    end
    title(titlestring)
    if P < 0.05 % plot the line only if  <0.05
     myplot(Xhat,Yhat,'L',linecolor);
    end
%    legend({'' ,  ['R = ' num2str(R,2) '; p = ' num2str(P,2) ]})
% grab labels from table 
if istable(X)
     xlabel(X.Properties.VariableNames)
end
if istable(Y)
     ylabel(Y.Properties.VariableNames)
end

Rout = R;
Pout = P;

legend(titlestring, ['y = ' num2str(BS(1), 2) ' + '  num2str(BS(2), 2) ' * x'])