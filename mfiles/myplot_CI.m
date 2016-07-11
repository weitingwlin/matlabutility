%% myplot_CI
% This function plots multiple sets of confidence interval and data sets. 
%
% Text and style can be controled as optional inputs.
%% Usage
% *Syntax*
%
%  myplot_CI (points, box_lim)
%
%  *  points    % vector of X values, data point of interest
%  *  box_lim   % 2*X  data, CI for X sets 
%
%  myplot_CI (points, box_lim, box_mid, Nt,texts, style)
%
%  *  box_mid   % Optional, vector of X values, median
%  *  Nt= 4     % Optional, approximate number of Y ticks you want, default = 4 
%  *  texts     % Optional, structure to add text, please see X_myplot_CI.m for detail 
%                  % e.g.    texts.xmarks = {'A','B','C','D'}
%  *  style     % Optional, structure to change style, please see X_myplot_CI.m for detail 
%                  % e.g.    style.sigmarker = '*';
%
% Example of usage can be found in *[X_myplot_CI.m]*.
%
% An _html_ documentation can be created by "publishing"  *[X_myplot_CI.m]*
%% File info
% Dependent file: [auto_tick.m] 
% Wei-Ting Lin    2014/10/18
% update: 2014/10/21 fix bugs about significant data
% update: 2014/10/22 fix bugs about text position, rotate ylabel if it's long
% update: 2015/10/19 fix bugs about tick mark
% update: 2016/06/09 sort box_lim automatically
%%
function myplot_CI(points,box_lim, box_mid,Nt,texts,style)
if (nargin < 6), style = []; end
if (nargin < 5), texts = []; end
if (nargin < 4), Nt = 4; end 
if (nargin < 3), box_mid=[];end % default number of ticks
%%
if isempty(find(box_lim(1,:) > box_lim(2,:)) ) == 0
    box_lim = sort(box_lim); 
  %'Input [box_lim] sorted so box_lim(1,:) should smaller'
end
%% calculate yframe and ymark by function auto_tick
   f_1 = max(max([box_lim;box_mid;points]));
   f_2 = min(min([box_lim;box_mid;points]));
   fl = f_1-f_2;
ymark  = auto_tick(f_1,f_2,Nt);
yframe = [ymark(1)-0.05*fl    ymark(end)+0.05*fl]; % the Y axis should be a little longer 

%% Plot the CI bar
[n,X] = size(box_lim);
lx = (X+1)/5; % length of about 1/5 of total length in x axis
for i=1:X
    h = plot([i i],box_lim(:,i),'-b','LineWidth',2);hold on    

        if isfield(style,'limcolor')
            set(h,'color',style.limcolor)
        end
        if isfield(style,'limwidth')
            set(h,'LineWidth',style.limwidth)
        end
end
%% Plot the mid point
if isempty(box_mid)==0
h = plot([1:X],box_mid ,'ob','LineWidth',2); 
    if isfield(style,'midmarker')
    set(h,'marker',style.midmarker)
    end
    if isfield(style,'midcolor')
    set(h,'color',style.midcolor)
    end
    if isfield(style,'midfacecolor')
    set(h,'MarkerFaceColor',style.midfacecolor)
    end
    if isfield(style,'midsize')
    set(h,'MarkerSize',style.midsize)
    end
     if isfield(style,'midwidth')
    set(h,'LineWidth',style.midwidth)
    end
end    
    
%% Plot the data point
% find out significant data
% If not specified, significant data style = non-signimficant ones
ind_sig = find((points > box_lim(2,:)) + (points < box_lim(1,:)));
ind_insig = find(( (points > box_lim(2,:)) + (points < box_lim(1,:)) ) == 0);

h0 = plot(ind_insig,points(ind_insig) ,'ok','MarkerFaceColor','k');
h1 = plot(ind_sig,points(ind_sig) ,'ok','MarkerFaceColor','k');

    if isfield(style,'datamarker')
            set(h0,'marker',style.datamarker)
            set(h1,'marker',style.datamarker)
    end
    if isfield(style,'sigmarker')
       set(h1,'marker',style.sigmarker)
    end
    %
    if isfield(style,'datacolor')
            set(h0,'color',style.datacolor)
             set(h1,'color',style.datacolor)
    end
           if isfield(style,'sigcolor')
            set(h1,'color',style.sigcolor)
           end
    %
    if isfield(style,'datafacecolor')
            set(h0,'MarkerFaceColor',style.datafacecolor)
             set(h1,'MarkerFaceColor',style.datafacecolor)
    end 
        if isfield(style,'sigfacecolor')
            set(h1,'MarkerFaceColor',style.sigfacecolor)
        end
   %     
    if isfield(style,'datasize')
        set(h0,'MarkerSize',style.datasize)
          set(h1,'MarkerSize',style.datasize)
    end
        if isfield(style,'sigsize')
           set(h1,'MarkerSize',style.sigsize)
        end
 %
     if isfield(style,'datawidth')
            set(h0,'LineWidth',style.datawidth)
            set(h1,'LineWidth',style.datawidth)
     end
            if isfield(style,'sigwidth')
            set(h1,'LineWidth',style.sigwidth)
            end
 
%% Plot the y = zero line (instead of x axis) 
if isfield(style,'zeroplot')==0 % default set to 1
    style.zeroplot=1;
end
% plot if specified 1 or not specified
if style.zeroplot==1
    h = plot([0.5 0.5+X],[0 0],'-k','LineWidth',2);
        if isfield(style,'zerostyle')
            set(h,'linestyle',style.zerostyle)
        end
        if isfield(style,'zerocolor')
            set(h,'color',style.zerocolor)
        end
        if isfield(style,'zerowidth')
            set(h,'LineWidth',style.zerowidth)
        end
end

%% Frame and  y ticks
% add tick mark
  for i=1:length(ymark)
     plot([0.5 0.5+(X+1)/60],repmat(ymark(i),1,2),'-k','LineWidth',2);
  end
  
% set the frame
plot([0.5 0.5],yframe,'-k','LineWidth',2)
axis([0, X+1, yframe])
axis off
box off

% add tick label
  for i=1:length(ymark)
    text(0.5-(X+1)/60,ymark(i),num2str(ymark(i)),'HorizontalAlignment','right','FontSize',12);
  end
%% Texts
if isfield(texts,'title')
title(texts.title,'FontSize',16);
end

if isfield(texts,'ylabel')
h = text(0.5- lx/2,median(ymark),texts.ylabel,'FontSize',13,'HorizontalAlignment','right')
   if length(texts.ylabel)>=5
      set(h, 'rotation', 90,'HorizontalAlignment','center','VerticalAlignment','baseline') 
   end
end

 if isfield(texts,'xlabel') 
text((X+1)/2,ymark(1)-fl/6,texts.xlabel,'HorizontalAlignment','center','VerticalAlignment','top','FontSize',13)
 end
 
 if isfield(texts,'xmark')
 text(1:X,repmat(ymark(1)-fl/6,1,X),texts.xmark,'FontSize',12,'VerticalAlignment','bottom')
 end
 
 