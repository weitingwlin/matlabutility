% shuffler
% (2013/9/26  Lin, Wei-Ting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :new_data=shuffler(data, direction)   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%


function new_data=shuffler(data, direction)
if (nargin < 2), direction=1; end;

[N,P]=size(data);
new_data=zeros(N,P);
%%%%%%%%%
if direction==1% vertically shuffle within each columes
for i=1:P
   temp=[rand(N,1) data(:,i) ];
    temp2=sortrows(temp);
    new_data(:,i)=temp2(:,2);
end
end
%%%%%%
if direction==2 % horizontally shuffle within each rows
for i=1:N
   temp=[rand(1,P); data(i,:)];
    temp2=sortrows(temp')';
    new_data(i,:)=temp2(2,:);
end
end