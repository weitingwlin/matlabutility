% facilitating the use of accumarray
% 
% deal of problem of zero and non-1-to-N groups
% 2016/06/08
function [gout, groupout] = groupmean(group, data, listin)

    if nargin < 3
       listin = unique(group);
    end
% B is the temprorary group id used in accumarray
        list = unique(group);
        B = zeros(size(group));
    for i = 1: length(list)
            B(group == list(i)) = i;
    end
    C = ones(size(data)) ; % c for count

        groupsum =  accumarray(B(:), data(:));
        groupcount =   accumarray(B(:), C(:));
    out = groupsum./groupcount; 

% prepare groupout
    gout = zeros(size(listin));
    for j = 1:length(listin)
        if any(list == listin(j))
                gout(j) = out(list == listin(j));
        else
            gout(j) = nan;
        end
    end

% warning about ungrouped data
ungrouped =  ~ismember(list, listin);
if any(ungrouped)
warning('there are ungrouped data');
end
 
groupout = listin;