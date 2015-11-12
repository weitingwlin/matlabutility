%% Make style bar plot
% SYNTAX:
%               myplot_bar(data, Styles, Texts)
%
% [data]: n x p matrix, each column is a variable, with (at most) n points/replicates. 
%            variables with less than n datapoint represented by NaN 
% [Styles]: a structure, with fields
%              barcolor: vector of 3, code for color of the bars;
%              ebcolor: vector of 3, color of the error bars; default is equal to .barcolor
%              pointcolor: vector of 3, color of the datapoints; default is equal to .barcolor
%              ErrorOn: 0 or 1; whether to plot bar, default is 1 
%              BarOn: 0 or 1; whether to plot bar, default is 0 (mean value shown as a point)
%              DataPointsOn: whether to plot data points, default is 0
% [Texts]: a structure about text inputs, with fields
%              xlabels: character cell, name of each bar (column)
%              xlabel: 
%              ylabel:
%              title:
% 
% ref. Frankino class note
% Update 2015/10/29 : fix bug about x label
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
  end
if ~isfield(Styles,'ebcolor') % errorbar color 
  Styles.ebcolor = Styles.barcolor;
end
if ~isfield(Styles,'pointcolor') % errorbar color 
  Styles.pointcolor = Styles.barcolor;
end
 
 %% plots 
if isfield(Styles,'BarOn') && Styles.BarOn==1  
    bar(nanmean(data),'FaceColor', Styles.barcolor, 'EdgeColor', Styles.barcolor)
     % with bars, error bars are plotted smaller
     if isfield(Styles,'ErrorOn')==0 || Styles.ErrorOn==1    
     errorbar(nanmean(data),STE,'.','Color',Styles.ebcolor,'LineWidth',2)
     end
else % not ploting out the bar, error bars are plotted larger
    if isfield(Styles,'ErrorOn')==0 || Styles.ErrorOn==1  
    errorbar(nanmean(data),STE,'o','Color',Styles.ebcolor,'LineWidth',2, 'MarkerSize', 4,'MarkerFaceColor',Styles.ebcolor)
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