% function to calculate association index and the confidence interval
% improved? from [association_ind_bstr] by using subfunctions
% much faster
% [bootstrap_ci] [association_ind] [line2tri] [tri2line]
%     
% data: N X S matrix for N patches/sites and S species
%       Abundance data will be transformed to presence/absence (1/0) data
%       before processes
% itter: times of iteration; default=1000
% formula: the formula used in calculation
%         [1]: simple ratio; this is the defalt 
% alpha:  type one error, p-value of this stat. , default: 0.05
% tail:   making a one tail or two tail, default is 2, 
function [limit1, limit2, mid] = association_ind_bstr2(data, itter,formula,alpha, tail)
% set "simple ratio" as defalt formula
if (nargin < 5), tail = 2; end;
if (nargin < 4), alpha = 0.05; end;
if (nargin < 3), formula = 1; end;
if (nargin < 2), itter = 1000; end;

[N,S]=size(data); % N: number of site; 
                  % S:number of species
        SS = S*(S-1)/2; % number of pairs of species          
bstr_line = zeros(itter,SS); % prepare the empty matrix for bootstrap result
 
limit1=zeros(S,S);
limit2=zeros(S,S);

parfor i = 1:itter
    n_data = shuffler(data,1);% bootstrap data
    n_ind = association_ind(n_data); % association index for this bootstrap data
    bstr_line(i,:) = tri2line(n_ind);  
end
% 
%%% SYNTAX :CI=bootstrap_ci(data,alpha,tail)  %%%
CI = bootstrap_ci (bstr_line,alpha,tail);
mid=line2tri(median(bstr_line));
limit1=line2tri(CI(1,:));
limit2=line2tri(CI(2,:));
