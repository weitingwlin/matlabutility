function [limit1, limit2] = association_ind_bstr(data, itter, tails, alpha)
% set "simple ratio" as defalt formula
if (nargin < 4), alpha=0.05; end;
if (nargin < 3), tails=2; end;
if (nargin < 2), itter=1000; end;

data01=data>0; % transfer abundance data in to 1/0 data
[N,S]=size(data); % N: number of site; S:number of species
met=zeros(S,S); % prepare the empty matrix
A=alpha/tails*itter;% 
limit1=zeros(S,S);
limit2=zeros(S,S);

for i=1:(S-1)
    for j=i+1:S
%%%% calculate association index between species i and j
Si = data01(:,i); 
Sj = data01(:,j); 
temp_bstr=zeros(itter+1,1);
        for it=1:itter+1
              Si_p = shuffler(Si, 1); % permutated Si
              Sj_p = shuffler(Sj, 1);
        %%%%%%% calculate and save simulated association index
        YA = sum(Si_p>0 & Sj_p==0);% only species i present
        YB = sum(Sj_p>0 & Si_p==0);% only species j present 
        X = sum(Sj_p>0 & Si_p>0);  % both i, j present
        temp=X/(YA+YB+X);
        temp_bstr(it)=temp;
        %%%%%%%
        end
          sorted_bstr=sort(temp_bstr);
       
          limit1(i,j)=(sorted_bstr(floor(A+1))+sorted_bstr(ceil(A+1)))/2;
          limit1(j,i)=limit1(i,j);
          limit2(i,j)=(sorted_bstr(end+1-floor(A))+sorted_bstr(end+1-ceil(A)))/2;
          limit2(j,i)=limit2(i,j);
    end
end
asso_met=met;