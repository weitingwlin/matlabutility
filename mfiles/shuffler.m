%% shuffler
% 
% SYNTAX :
%               new_data=shuffler(data, direction)  
%               new_data=shuffler(data, direction, group, seed)
%
%       direction: 1: default. shuffle vertically (data stay in the same column)
%       group: identity of group for each column (direction = 1) or row
%                 (direction = 2). Shuffling will be done only within group.
%
% Examples:
%           A = repmat([1:15]', 1,10)
%           gA = [1 1 1 1 1 2 2 2 2 2 2 5 5 5 5]
%   shuffler(A, 1, gA)
%           B = repmat([1:15], 10, 1)
%           gB = [1 2 1 2 1 2 1 2 1 2 1 2 1 2 1]
%   shuffler(B, 2, gB)
% 
% 2013/9/26: Created  (Lin, Wei-Ting)
% 2016/03/29: redo using built in functin *randperm*, move back to mfiles
% 2016/04/08: add input *group*
function new_data=shuffler(data, direction, group, seed)
if (nargin < 2), direction = 1; end;
if (nargin < 3), group = []; end;
if (nargin == 4), rng(seed); end; % set seed 

[N,P]=size(data);
new_data=zeros(N,P);
%% Set group
if direction == 1
     if isempty(group) % set default values
         group = ones(N,1);
     end
     glist = unique(group);% list of groups 
     gl = length(glist);% number of groups
     if length(group)~=N % set error message
         error('Length of group must equal to number of rows.')
     end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if direction == 2
     if isempty(group) % set default values
         group = ones(1,P); % = number of columns
     end
     glist = unique(group);% list of groups 
     gl = length(glist);% number of groups
     if length(group)~=P % set error message
         error('Length of group must equal to number of columns.')
     end
end
%% shuffle vertically
if direction==1 
        for g = 1 : gl % for each group 
                id = find(group == glist(g) ); % rows belong to this group
                Ng = length(id);
                gData = data(id, :);
                if Ng == 1
                    warning('Some groups only have one member')
                end
                for i=1:P
                        new_data(id,i) = gData(randperm(Ng), i);
                end
        end
end
%%
if direction==2 % horizontally shuffle within each rows
        for g = 1 : gl % for each group 
                id = find(group == glist(g) ); % rows belong to this group
                Pg = length(id);
                gData = data(:,id);
                if Pg == 1
                        warning('Some groups only have one member')
                end
                for i=1:N
                        new_data(i,id) = gData(i, randperm(Pg));
                end
        end
end