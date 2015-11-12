% update: 2015/10/05
% (Realize this file is redundant of randsample), but still 
% 
%
% line_shuffler
% (2014/9/02  Lin, Wei-Ting)
% shufle a line (column or row) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :new_data=line_shuffler(data, direction)   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function new_data=line_shuffler(data, direction, replacement)
if (nargin < 3), replacement = 0; end;
if (nargin < 2), direction=1; end;

[N,P]=size(data);
%%%%%%%%%%%%%%%%%
if direction == 1 % vertically shuffle rows
     new_data = data(randsample(N,N,replacement),:);
end
%%%%%%%%%%%%%%%%
if direction==2 % horizontally shuffle columns
  new_data = data(:,randsample(P,P,replacement));
end
