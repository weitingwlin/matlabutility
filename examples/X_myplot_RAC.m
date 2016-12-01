%% mock data: 4 communities and 6 species
X = [0 15 3 1 6 0; 10 40 7 5 1 1;   5 0 0 1 0 0; 10 40 42 9 2 1]

%% Example: default usage
myplot_RAC(X);
%% Example: specify the string headers
myplot_RAC(X, 'Species', 'Zone');
% so the legends will be : 'Species 1', 'Species 2', ...
% and the titles willbe : 'Zone 1', 'Zone 2', ...
%% Example: specify the strings one by one
myplot_RAC(X, {'A', 'B', 'C', 'D', 'E','F'}, { 'January'    'February'    'March'    'April'});
% can also  use `num2month(1:4)`
%% Example: specify the master title
myplot_RAC(X, [], [] , {'Rank-Abundance Curve', 'Example'});
% (to use default value, put `[]` as placeholder)
%% Example: specify the color 
% if input is only one color, all symbles will have the same color
myplot_RAC(X, [], [], [], [0 0 0]);
% can also use (produce identical result)
%  myplot_RAC(X, [], [], [], 'k');
%  myplot_RAC(X, [], [], [], mycolor(1));
%  myplot_RAC(X, [], [], [], 1);
%       if input is an interger, select the color from `mycolor`
%% example: specify the colors one by one
 temp = lines; % use matlab built-in color map
 myplot_RAC(X, 'Species', num2month(1:4), [], temp(1:6,:));
% if input is color with length~=3, each number will be treated as color selector from `mycolor`
%     myplot_RAC(X, 'Species', num2month(1:4), [], 10:30);
%%  Example: specify the symbol
% input symbol will be recycled if not enough
    myplot_RAC(X, [], [], [], [], {'o', 's', 'd'});
% if input is only one symbol, all symbles will have the same color
%       myplot_RAC(X, [], [], [], [], 'o');
% Extra symbols will be ingored
%       myplot_RAC(X, [], [], [], [], {'o', 's', 'd', 'o', 's', 'd', '^', '<', '>'});
%% Example: cannot deal with too many species
    X2 = [1:35; 35:-1:1];
    myplot_RAC(X2);
    % will get error  message