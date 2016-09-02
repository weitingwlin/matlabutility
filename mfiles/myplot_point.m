% plotting point process on a time line
%
%SYNTAX 
%           myplot_point(events, type, color, linecolor)
%
%               events:  a vector of time points at whitch the events happen
%               type: style of events plotted
%                       'S': points;  'X': X;  'L': line or spikes
%               color: color of the event marker; see plates by typing `mycolor`
%               linecolor: color of the timeline
%  
% Depends on: [myplot.m], [myplot_vec.m], [mycolor.m]
%
% Examples:
%       X = sort(rand(10,1));
%   myplot_point(X);
%       xlabel('time'); ylabel('Events');
%   myplot_point(X, 'L',2);
%   myplot_point(X, 'X', 4, 1);
function h = myplot_point(events, type, color, linecolor)
if (nargin < 4 || isempty(linecolor)), linecolor = 7; end; 
if (nargin < 3 || isempty(color)), color = 3; end; 
if (nargin < 2 || isempty(type)), type = 'S'; end;   

%% warning message if the input data is not sorted
if ~issorted(events)
    warning('input data is not sorted');
end
%% plot events as points
if type =='S'
    myplot(events, zeros(1,length(events)),'S', color); hold on
    xlimits = get(gca,'Xlim');
    h=myplot(xlimits,[0 0],'L', linecolor);
    myplot(events, zeros(1,length(events)),'S',color);
end
%% plot events as X
if type =='X'
     plot(events, zeros(1,length(events)), 'x','MarkerEdgeColor', mycolor(color),'MarkerSize',10)
    xlimits = get(gca,'Xlim');
    h=myplot(xlimits,[0 0],'L', linecolor); hold on
    %myplot(events, zeros(1,length(events)),'S',color,8);
    plot(events, zeros(1,length(events)), 'x','MarkerEdgeColor', mycolor(color),'MarkerSize',10)
end
%% plot ecents as lines (or spike, rod)
if type =='L'
    for i=1:length(events)
        myplot_vec([events(i), 0], [events(i), 0.1], '',color); 
    end
    xlimits = get(gca,'Xlim');
    h=myplot(xlimits,[0 0],'L', linecolor); hold on
    axis([xlimits(1) xlimits(2) -1 1]);
end

%% setting appearence
ax = gca;
    ax.XColor = 'white'; % pratically remove the x axis
    set(gca, 'xtick',[]);
    ax.YColor = 'white';
    set(gca, 'ytick',[]);
    set(gca, 'box','off');
    set(get(gca,'ylabel'),'color',[0 0 0]);% restore labels
    set(get(gca,'xlabel'),'color',[0 0 0]);
