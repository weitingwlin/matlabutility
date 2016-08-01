%% Examples of using function myplot_loglog
%
% SYNTAX:
%     h = myplot_loglog(X, Y, type, color, style, baseX, baseY)
%
%     X, Y :data to be (maybe) transformed and plotted
%     type, color, style : variables to be passed to function `myplot`
%            * type : 'S' for scatter, 'L' for line, 'B' for both, [] for default ('S')   
%            * color :  RGB tripletcode, or select one color from `mycolor`, [] for default ( 3 , or darkblue)  
%            * style : style of line or symbal (e.g. 'o', ':'), [] for deafult
%     baseX, baseY: base of log transform on data X and Y. Can be 1 (not transformed), 2, e (default), or 10.
%                           [] for default (e)
%
% depend on: [auto_tick], [myplot], [mycolor], [mystyle]
%% Create mock data
    X = exp([1: 0.1 :2] );
    Y = exp([0: 0.4 :4] + rand(1,11)/5);
    figure
    myplot(X,Y); 
        title('Original scale')
%% Default usage
% scatter, darkblue, both X and Y log_e transformed
    figure
    myplot_loglog(X,Y); 
        title('log - log scale')
%% Change styles
% see also documents of `myplot`, `mycolor`, `mystyle`
      figure
      myplot_loglog(X,Y, 'B', 1); % 'B'oth points and line, 1 for black (type `mycolor` to check plate)
        title('log - log scale')
%% another example
% to use default values, put [] as place holder
% Example: to change only style
       figure
       myplot_loglog(X,Y, [], [], 3); % style = 3 for dimond (type `mystyle` to check plate)   
%% Change base
% put [] as place holder for variables not specified
%
%  only transform Y
        figure
        myplot_loglog(X,Y, [], [], [], 1);
%  only transform X
        figure
        myplot_loglog(X,Y, [], [], [], [], 1);
% change base to 10
        figure
        myplot_loglog(X,Y, [], [], [], 10, 10);