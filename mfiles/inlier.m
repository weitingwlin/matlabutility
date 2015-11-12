% Remove outliers from vectors
% (2015/9/10  Lin, Wei-Ting)
% Method and default value suggested by Leys et al. 2013
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX :new_data = inlier(old_data, threshold, 'type')   %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%
% 
function new_data = inlier(old_data, threshold, type)
if (nargin < 3), type = 'median'; end;
if (nargin <2), threshold = 2.5; end; % Suggested by Leys et al. 2013

% calculating mad: Mean or median absolute deviation
if strcmp(type,'median')
    MAD= mad(old_data,1);
end
if strcmp(type,'mean')
    MAD= mad(old_data);
end

% center value
CTR = median(old_data);
% deviation: 
DEV = abs(old_data-CTR)./MAD;

% keep only data within the threshold
new_data = old_data(DEV<=threshold);

