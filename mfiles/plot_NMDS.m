
function [Y, stress, disparity, h] = plot_NMDS(data, groups, labels, groupcolormap)
[n,p] =size(data);
% * data : n x p matrix, each row is an observation, each column is a
% variable
% 
% Data should be transformed for better normality and/or standardized
if (nargin < 2), groups = ones(n,1); end;
if (nargin < 4), groupcolormap = 'parula' ;end;
if (nargin >=3 && length(labels(1,:))==3) % can "skip" entry of labels
    groupcolormap = labels;
    labels = [];
end
    %% Dissilimarity
% Since Z-transformed data looks more noraml, we use Zdata 
Dissim = pdist(data); % the dissimilarity data
%% NMDS
% Output Y is the cordinate of each observation (in this case "patch") in
% the two dimentions
[Y, stress, disparity] = mdscale(Dissim,2,'criterion','stress');
                                          % For a "Nonmetric MDS"
%%
h = []; % output graph handle
if isa(groups,'double')==1
    grouplist = unique(groups);
    % List of unique value in the group
        for i=1:length(grouplist)
            if length(grouplist) <= 10
                    myplot(Y(groups==grouplist(i),1),Y(groups==grouplist(i),2),'S',i ,i) ; hold on   
                    if (nargin >= 2)
                        legend(num2str(grouplist)); 
                    end
            else
                  h{1} = scatter(Y(:,1), Y(:,2), 40 , groups, 'filled')   ; hold on                  
                   set(gca,'FontSize',14,'linewidth',2);
                
                         colormap(groupcolormap);
                   h{2} =   colorbar;
            end
        end
  
elseif isa(groups,'cell')==1
    grouplist2 = unique(groups);
        for i=1:length(grouplist2)
           h1 = myplot(Y(strcmp(groups,grouplist2(i)),1),Y(strcmp(groups,grouplist2(i)),2),'S',i) ; hold on
        end
        legend(grouplist2)

    else
    error('[groups] should be a numeric vector or a cell array of atring')
end
%%
if ~(nargin < 3 || isempty(labels))
    if isnumeric(labels)
     strlabels={};
    for i=1:length(labels)    
        strlabels{i} = num2str(labels(i)); 
    end;
    labels = strlabels;
    end

    for i = 1 : length(Y(:,1))
        text(Y(i,1),  Y(i,2), labels(i))
    end
end
