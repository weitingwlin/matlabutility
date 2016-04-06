% shuffler
% (2013/9/26  Lin, Wei-Ting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :new_data=shuffler(data, direction)   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% direction: 1: default. shuffle vertically (data stay in the same column)
% 
% 2016/03/29: redo using built in functin *randperm*, move back to mfiles

function new_data=shuffler(data, direction, seed)
if (nargin < 2), direction=1; end;
if (nargin ==3), rng(seed); end; % set seed 

[N,P]=size(data);
new_data=zeros(N,P);
%%%%%%%%%
if direction==1% vertically shuffle within each columes
        for i=1:P
        new_data(:,i) = data(randperm(N), i);
        end
end
%%%%%%
if direction==2 % horizontally shuffle within each rows
for i=1:N
    new_data(i,:) = data(i, randperm(P));
end
end