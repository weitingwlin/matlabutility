% Associaiton index
% (2013/9/26  Lin, Wei-Ting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :asso_met = association_ind(data, formula)    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% asso_met:  return a "index" metrics, symmetric
%     
% data: N X S matrix for N patches/sites and S species
%       Abundance data will be transformed to presence/absence (1/0) data
%       before processes
% formula: the formula used in calculation
%         [1]: simple ratio; this is the defalt 

function asso_met = association_ind(data, formula)
% set "simple ratio" as defalt formula
if (nargin < 2), formula=1; end;

data01=data>0; % transfer abundance data in to 1/0 data
[N,S]=size(data); % N: number of site; S:number of species
met=zeros(S,S); % prepare the empty matrix

for i=1:(S-1)
    for j=i+1:S
%%%% calculate association index between species i and j
Si = data01(:,i); Sj = data01(:,j); 
    % N x 1 vectors,occurance data of species i & j
YA = sum(Si>0 & Sj==0);% only species i present
YB = sum(Sj>0 & Si==0);% only species j present 
X = sum(Sj>0 & Si>0);  % both i, j present
temp=X/(YA+YB+X);
met(i,j)=temp;
met(j,i)=temp;

    end
end
asso_met=met;
