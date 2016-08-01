%% Make a nice log log plot quickly 
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
%
% Wei-Ting Lin  2016/08/01
%
function h = myplot_loglog(X, Y, type, color, style, baseX, baseY)
if (nargin < 7 || isempty(baseY) ), baseY = exp(1); end;
if (nargin < 6 || isempty(baseX) ), baseX = exp(1); end;
if (nargin < 5 ), style = []; end;
if (nargin < 4 ), color = []; end;
if (nargin < 3 ), type = []; end;
%% transform X
    if baseX == 1
            logX = X;
            xBaseString = ''; xEndString = '';
    elseif baseX ==10
                logX = log10(X);
                xBaseString = '10^{'; xEndString = '}';
    elseif  baseX ==exp(1)
                logX = log(X);
                xBaseString = 'e^{'; xEndString = '}';
    elseif  baseX ==2
                logX = log2(X);
                xBaseString = 'e^{'; xEndString = '}';
    else
                error('x base should be e, 10, 2 or,1') ; 
    end
%% transform Y
    if baseY == 1
            logY = Y;
            yBaseString = ''; yEndString = '';
    elseif baseY ==10
                logY = log10(Y);
                yBaseString = '10^{'; yEndString = '}';
    elseif baseY ==exp(1)
                logY = log(Y);
                yBaseString = 'e^{'; yEndString = '}';
    elseif  baseY ==2
                logY = log2(Y);
                yBaseString = 'e^{'; yEndString = '}';
     else
                error('y base should be e, 10, 2 or,1') ; 
     end
%% make the plot
    h = myplot(logX, logY, type, color, style);
%% redo the ticks
    Fs = axis; % get the axis
    ax = gca;
    xtick  = auto_tick(Fs(1), Fs(2));
    ytick = auto_tick(Fs(3), Fs(4));
    
    for i = 1: length(xtick )
        xtickname{i} = [xBaseString   num2str(xtick(i), 2)   xEndString]; 
    end
    for i = 1: length(ytick )
        ytickname{i} = [yBaseString   num2str(ytick(i), 2)   yEndString]; 
    end
 %% put on ticks
    ax.XTick  = xtick;
    ax.YTick = ytick;
    ax.XTickLabel = xtickname;
    ax.YTickLabel = ytickname;