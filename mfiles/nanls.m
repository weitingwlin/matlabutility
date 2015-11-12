% calculate parameters  in ls line, and correlation coefficient R, and P values
%
%   SYNTAX : [B_ls,Rout,Pout] = nanls(X,Y)   %%%%
%
%    X,Y: vectors of data, can be variables in a table (e.g. T.var2)
%
%    B_ls: return the parameters [B0 B1] in LS line
%          y = B0 + B1 * x 
%                                   B_ls(2): Slope
%                                   B_ls(1): Intercept
% Rout: correlation coefficient R
% Pout: P value
% 
% used in myplot_ls.m, replace LS_combo in the future
   function [B, R, P] = nanls(X,Y)
% with tables
if (istable(X)), X=table2array(X); end
if (istable(Y)), Y=table2array(Y); end  

% reorienting input
   if length(X(:,1))==1
        X=X';
   end
   if length(Y(:,1))==1
        Y=Y';
   end
   
% remove NaN
   ind =  (isnan(X) + isnan(Y)) == 0;
   if  ~isempty(find(ind == 0, 1))
   warning('remove some NaN')
   end
   X = X(ind);
   Y = Y(ind);
   
% calculate ls parameters
   A = [ones(length(X),1),X]; % X should be a verticle vector
   B = inv(A'*A)*A'*Y; %[b0; b1]
       [Rt,Pt] = corrcoef(X,Y);
 
   R = Rt(2);
   P = Pt(2);