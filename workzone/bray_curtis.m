% Bray-Curtis index
% The total number of species that are unique to any one of the two sites divided by the total number of species over the two sites
% (2013/9/24  Lin, Wei-Ting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :BCmet=bray_curtis(data)    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BCmet:   return a "distance" metrics N x N
%     
% data: N X S matrix for N patches/sites and S species
%       Abundance data will be transformed to presence/absence (1/0) data
%       before processes

function BCmet=bray_curtis(data)
data01=data>0; % transfer abundance data in to 1/0 data
[N,S]=size(data); % N: number of site; S:number of species

met=zeros(N,N); % prepare the empty matrix

for i=1:(N-1)
    for j=i+1:N
    A=data01(i,:);
    B=data01(j,:);
    Rtotal=sum((A+B)>0,2); % the total richness
    Runique=sum((A+B)==1,2);% richness of species unique to either of the sites
    bc=Runique/Rtotal; % the bray-curtis index of sites A and B
    met(i,j)=bc;met(j,i)=bc; % fill in the data frame,   
    end
end

BCmet=met;