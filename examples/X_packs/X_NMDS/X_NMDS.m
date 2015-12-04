%% Setting up and load data
clear;clc
% cd 'C:\Users\Wei-Ting\Dropbox\DataCoding\MATLAB\utility_wtl\X_examples\X_packs\X_NMDS'
 load X_community
%
% Dependency:[statistics toolbox],[myplot],[script_mycolorplates]
%% Data description
% X_community contains two matrices, and two "name" files:
%
% * insect_data : 44 x 13 matrix, data for 44 patches and 13 species 
% * patch_met : 44 x12 matrix, data for 44 patches and 12 patch attributes
% * insect_names : vector with length 13, content of the insects
% * met_names : vector with length 13, content of the patch attributes
% I like to keep data as a matrix and put their names in a seperate file.
%
% I will use data [insect_data] in this example; where patch represents "observation", species represent "variable" 
%
% I will use the three "sites" of patches as group, to plot with different color 
rawdata = insect_data;
group = patch_met(:,1);

%% View the oringinal data
% Here each patch is a community represented as vector of species composition
% 
%           dimension = # of species 
%
[n,p] =size(rawdata);% There are n sites and p species.
%% Log-transformed 
% View the transformed data by printing out the first 10 observations
%
% Log transformation is one common way in population biology

Ldata = log(rawdata+1); % The data is log-transformed 
                            % +1 so the population size 0 will not get -inf
for i=1:10
myplot(1:13,Ldata(i,:),'L',i);hold on
end
xlabel('Species'); ylabel('Frequency')
legend('Community 1', 'Community 2', 'Community 3', 'Community 4','...','...')
title('log-transformed data for the first 10 patches')
%% Z-transformed
% Another way to get normality is Z transformation; 
%
% Z = (X-mean)/std 
Zdata= zscore(rawdata);
% Plot
figure
for i=1:10
myplot(1:13,Zdata(i,:),'L',i);hold on
end
xlabel('Species'); ylabel('Frequency')
legend('Community 1', 'Community 2', 'Community 3', 'Community 4','...','...')
title('Z-transformed data for the first 10 patches')
%%
% Another way to transform data is square-root
%% Dissilimarity
% Since Z-transformed data looks more noraml, we use Zdata 
Dissim = pdist(Zdata); % the dissimilarity data
%% NMDS
% Output Y is the cordinate of each observation (in this case "patch") in
% the two dimentions
[Y, stress, disparity] = mdscale(Dissim,2,'criterion','sstress');
                                          % For a "Nonmetric MDS"
figure
myplot(Y(:,1),Y(:,2),'S')
title('NMDS')
%% Separating the points (observations) by group: numeric
% Plot the result in different color, seperated by group 
group = patch_met(:,1);
% See met_names(1), the first column in patch_met is the site identity of
% the patch
grouplist = unique(group);
% List of unique value in the group
figure
for i=1:length(grouplist)
    myplot(Y(group==grouplist(i),1),Y(group==grouplist(i),2),'S',i) ; hold on
end
legend(num2str(grouplist));
title('NMDS by factor "site"')
%%  Separating the points (observations) by group: cell array of string
group2 = importdata('./mockdata/fakedata.txt');
% File like this can be created using excel "save as" .txt
grouplist2 = unique(group2);
figure
for i=1:length(grouplist2)
    myplot(Y(strcmp(group2,grouplist2(i)),1),Y(strcmp(group2,grouplist2(i)),2),'S',i) ; hold on
end
legend(grouplist2)