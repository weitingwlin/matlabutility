%% Usage example of function plot_NMDS
% Input
%
% * [data]: n rows each represent one observation, p colunms each represent
% a variable
% * [groups]: Optional, vector of length n, numeric, the group id of each observation
%% Setting up and load data
clear;clc
% load data
    insect_data= load('./mockdata/insectdata.txt');% community data
rawdata = insect_data; 
group= load('./mockdata/group1.txt'); % group information, numeric
group2 = importdata('./mockdata/fakedata.txt'); % group information in text
% Files like this can be created using excel "save as" .txt
[n,p] =size(rawdata);% There are n sites and p species.
%% Data description
% * insect_data : 44 x 13 matrix, data for 44 (n) patches and 13 (p) species 
% * group : numeric vector of size n, "site" information
% * group : cell array of string of size n; "site" information for patches
%
% I will use data [insect_data] in this example; where patch represents "observation", species represent "variable" 
%
% I will use the three "sites" of patches as group, to plot with different color 

%% Z-transformed
% one way to get normality is Z transformation; other methods including log(N+1) and square root 
%
% uncomment this to log-transform, and replace Zdata with Ldata in following codes
%
% Ldata = log(rawdata+1)
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
%% NMDS and plot using plot_NMDS
% [groups] is optional, using Z-transformed data as the sole input gives a
% simple scatter plot
plot_NMDS(Zdata);
title({'NMDS'; ['stress = ' num2str(stress)]})
%% Adding input [groups] can seperate the 
[Y, stress, disparities]=plot_NMDS(Zdata,group);
title({'NMDS by sites'; ['stress = ' num2str(stress)]})
%%   Separating the points (observations) by group: cell array of string

[Y, stress, disparities]=plot_NMDS(Zdata,group2);
title({'NMDS by sites'; ['stress = ' num2str(stress)]})
%% Analysis of stress
distancesY = pdist(Y); % distance on the nmdscale
Diss = pdist(Zdata);
[dum,ord] = sortrows([disparities(:)  Diss(:) ]);

figure
    plot(Diss,distancesY,'bo', ...
           Diss(ord),disparities(ord),'r.-', ...
            [0 15],[0 15],'k-')
    xlabel('Dissimilarities (Data)')
    ylabel('Distances/Disparities (NMDS plot)')
    legend({'Distances' 'Disparities' '1:1 Line'},...
       'Location','NorthWest');