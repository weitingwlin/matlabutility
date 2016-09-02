%% Set up working folder and utility path
% for each project, open the  work_setup.m file first
% 
% The setup file should contain
%% Get current machine name
[stt, strout] = system('hostname');

%%% set working directory and path
if strncmp(strout, 'ChrisdeMacBook-Air.local',5)
    cd '/Users/weitinglin/Dropbox/DataCoding/utility_wtl/examples'
    addpath '/Users/weitinglin/Dropbox/DataCoding/utility_wtl/mfiles'
end

% PC
if strncmp(strout,'wlin_pc',5)
 cd 'C:\Users\Wei-Ting\Dropbox\DataCoding\utility_wtl\examples'
 addpath 'C:\Users\Wei-Ting\Dropbox\DataCoding\utility_wtl\mfiles'
end

% laptop
if strncmp(strout,'Weiting-PC',5)
 cd 'C:\Users\Weiting\Dropbox\DataCoding\utility_wtl\examples'
 addpath 'C:\Users\Weiting\Dropbox\DataCoding\utility_wtl\mfiles'
end


clear strout stt