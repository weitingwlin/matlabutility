%% Set up working folder and utility path
% for each project, open the  work_setup.m file first
% 
% The setup file should contain
%% Get current machine name
[stt, strout] = system('hostname');

%%% set working directory and pathgui
if strncmp(strout, 'weitingdeAir',5)
    cd '/Users/weitinglin/Dropbox/DataCoding/utility_wtl/examples/X_apps'
    addpath '/Users/weitinglin/Dropbox/DataCoding/utility_wtl/mfiles'
end

% PC; home
if strncmp(strout,'wlin_pc',5)
 cd 'C:\Users\Wei-Ting\Dropbox\DataCoding\utility_wtl\examples\X_apps'
 addpath 'C:\Users\Wei-Ting\Dropbox\DataCoding\utility_wtl\mfiles'
end
% addpath ''
% laptop; lab
if strncmp(strout,'Weiting-PC',5)
 cd 'C:\Users\Weiting\Dropbox\DataCoding\utility_wtl\examples\X_apps'
 addpath 'C:\Users\ASUS\Dropbox\DataCoding\utility_wtl\mfiles'
 datapath = 'C:\Users\ASUS\Dropbox\DataCoding\utility_wtl\examples\X_data\'
end
clear strout stt
pwd