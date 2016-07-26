%% Make style bar plot
% NaN removed, SE as error bar
%
% SYNTAX:
%               myplot_bar(data, Styles, Texts)
%
% [data]: n x p matrix, each column is a variable, with (at most) n points/replicates. 
%            variables with less than n datapoint represented by NaN 
% [Styles]: a structure, with fields
%              barcolor: color* of the bars
%              barfill : whether or what color to fill the bar; value 'On' mean the same color as barcolor, otherwise specify a  color*. 
%                            Default is [0 0 0] (white, no fill)
%              ebcolor: color* of the error bars; default is equal to .barcolor
%              ebhead:  width of error bar head, default is 0, no head (So it looks like l not I)
%              pointcolor: vector of 3, color of the datapoints; default is equal to .barcolor
%              ErrorOn: 0 or 1; whether to plot error bar, default is 1 
%              BarOn: 0 or 1; whether to plot bar, default is 0 (then the mean value shown as a point)
%              DataPointsOn: whether to plot data points, default is 0
% [Texts]: a structure about text inputs, with fields
%              xlabels: character cell, name of each bar (column)
%              xlabel:  
%              ylabel:
%              title:
% 
% ref. Frankino class note
% Depends on: mycolor, myplot_errorbar
%
% Update 2015/10/29 : fix bug about x label
% Update 2016/07/25 : add Styles,ebhead, use myplot_errorbar
function myplot_bar(data, Styles, Texts)
if (nargin < 3), Texts = struct([]); end 
if (nargin < 2), Styles = struct([]);end;  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   STE = nanstd(data)./sqrt(sum(~isnan(data)));% standard error
   hold on
  [n,p]=size(data);

  %% assign default color 
  if ~isfield(Styles,'barcolor')
      Styles=struct('barcolor',mycolor(3)); 
 else
       if  length(Styles.barcolor) == 1 % use color selector from mycolor
         Styles.barcolor = mycolor(Styles.barcolor);
        end
  end
      
if ~isfield(Styles,'barfill') % errorbar color 
    Styles.barfill = [1 1 1];
else
    if  strcmp(Styles.barfill,'On') % simply means "on"; filled with barcolor
         Styles.barfill = Styles.barcolor;
    end
     if  length(Styles.barfill) == 1 % simply means "on"; filled with barcolor
         Styles.barfill = mycolor(Styles.barfill);
    end
end
  
if ~isfield(Styles,'ebcolor') % errorbar color 
    Styles.ebcolor = Styles.barcolor;
else
    if  length(Styles.ebcolor) == 1 % simply means "on"; filled with barcolor
         Styles.ebcolor = mycolor(Styles.ebcolor);
    end
end

if ~isfield(Styles,'ebhead') % errorbar width
    Styles.ebhead = 0;
end

if ~isfield(Styles,'pointcolor') % errorbar color 
  Styles.pointcolor = Styles.barcolor;
 else
     if  length(Styles.pointcolor) == 1 % simply means "on"; filled with barcolor
         Styles.pointcolor = mycolor(Styles.pointcolor);
    end
end
% Error bar style; to pass to the function myplot_errorbar
  ERstyle = [];
  ERstyle.lincolor = Styles.ebcolor;
  ERstyle.linewidth = 4;
  ERstyle.headlength =   Styles.ebhead;
 
 %% plots 
if isfield(Styles,'BarOn') && Styles.BarOn==1  
    bar(nanmean(data),'FaceColor', Styles.barcolor, 'EdgeColor', Styles.barcolor, 'FaceColor', Styles.barfill ,'LineWidth',2)
     % with bars, error bars are plotted larger
     if isfield(Styles,'ErrorOn')==0 || Styles.ErrorOn==1    
            myplot_errorbar(nanmean(data),STE, ERstyle);
     end
else % not ploting out the bar, error bars are plotted smaller
    if isfield(Styles,'ErrorOn')==0 || Styles.ErrorOn==1  
            myplot(1:p, nanmean(data), 'S');
            ERstyle.linewidth = 3;
            myplot_errorbar(nanmean(data),STE, ERstyle);
    end
end

%%%%%% Data points
if isfield(Styles,'DataPointsOn') && Styles.DataPointsOn==1  
    for P=1:p
        A = data(:,P);
       plot(repmat(P+0.1,1,sum(isnan(A)==0) ),A(isnan(A)==0),'o','MarkerSize', 3,'color',Styles.pointcolor,'Markerfacecolor',Styles.pointcolor);
    end
end

 %% Add texts
set(gca,'FontSize',14,'linewidth',2)  
if isfield(Texts,'xlabels')
   set(gca, 'XTick', 1:length(data(1,:)), 'XTickLabel', Texts.xlabels);
end

if isfield(Texts,'xlabel')
   xlabel(Texts.xlabel,'FontSize',14);
end

if isfield(Texts,'ylabel')
   ylabel(Texts.ylabel,'FontSize',14);
end

if isfield(Texts,'title')
    title(Texts.title,'FontSize',14)
end
   
xlim([0 length(data(1,:))+1])
box off