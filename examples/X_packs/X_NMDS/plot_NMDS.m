
function [Y, stress, disparity]=plot_NMDS(data,groups)
[n,p] =size(data);
% * data : n x p matrix, each row is an observation, each column is a
% variable
% 
% Data should be transformed for better normality and/or standardized
if (nargin < 2), groups = ones(n,1); end;
%% Dissilimarity
% Since Z-transformed data looks more noraml, we use Zdata 
Dissim = pdist(data); % the dissimilarity data
%% NMDS
% Output Y is the cordinate of each observation (in this case "patch") in
% the two dimentions
[Y, stress, disparity] = mdscale(Dissim,2,'criterion','stress');
                                          % For a "Nonmetric MDS"
%%
if isa(groups,'double')==1
    grouplist = unique(groups);
    % List of unique value in the group
    figure
        for i=1:length(grouplist)
        myplot(Y(groups==grouplist(i),1),Y(groups==grouplist(i),2),'S',i) ; hold on
        end
    if (nargin == 2)
    legend(num2str(grouplist)); 
    end
elseif isa(groups,'cell')==1
    grouplist2 = unique(groups);
    figure
        for i=1:length(grouplist2)
            myplot(Y(strcmp(groups,grouplist2(i)),1),Y(strcmp(groups,grouplist2(i)),2),'S',i) ; hold on
        end
        legend(grouplist2)

    else
    error('[groups] should be a numeric vector or a cell array of atring')
end

