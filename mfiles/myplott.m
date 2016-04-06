%% Make style bar plot
% SYNTAX:
%             myplott(tabin, inddata, indgroup, Styles, Texts)
%
% [tabin]: table, where data is
% [inddata]: string (character), variable name of tabin, ploted at Y axis
% [indgroup]: string (character) or cell array of string (length = 2), variable name(s) of tabin
%                  if is string, is the grouping variable ploted at X axis
%                  if is cell, the first is grouping variable, the second another grouping variable to be
%                  ploted in different color
% [Styles]: a structure, with fields
%              ebcolor: vector of 3, or matrix of n x 3, color of the error bars; default is blue, and
%              color change fallow the color plate on mycolor.m 
%              pointcolor: vector of 3, or matrix of n x 3, color of the datapoints; default is equal to .ebcolor
%              DataPointsOn: whether to plot data points, default is 0
%              LegendOn: whether to plot data points, default is 0
% [Texts]: a structure about text inputs, with fields
%              xlabels: character cell, name of each bar (column)
%              xlabel: 
%              ylabel:
%              title:
% 
% Update 2015/11/3
% Update 2016/1/5 : point style change for group 2
function myplott(tabin, inddata, indgroup, Styles, Texts)
if (nargin < 5), Texts = struct('placehoder',[]); end 
if (nargin < 4), Styles = struct('placeholder',[]);end; 

  if ~iscell(indgroup)
          indgroup = {indgroup};
  end
      TF = ~any(ismissing(tabin(:,{inddata, indgroup{:}})),2); % index for row without missing data

 Texts.ylabels=inddata;
  
  % decide whether ther is a indcolor
      group2 = categorical(ones(sum(TF),1)) ; % if there is no group2, make a dummy
      indgroup1 = indgroup{1} ;
   if length(indgroup) >1 
      indgroup2 = indgroup{2} ; 
         %  if ~iscategorical(tabin{:,{indgroup2}})
          group2 = categorical(tabin{TF,{indgroup2}});
        % end           
   end
    
   %
   if ~iscategorical(tabin{:,{indgroup1}})
      group1 = categorical(tabin{TF,{indgroup1}});
   else
           group1 = tabin{TF,{indgroup1}};
   end        
      Texts.xlabels = categories( categorical(group1))' ;  
      Texts.xlabel = indgroup1;
      
    data =  tabin{TF,{inddata}};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 cat2 =categories(group2)';
   cat1 =categories(group1)';

  %% assign default color 

if ~isfield(Styles,'ebcolor') % errorbar color 
  for i =1:length(cat2)
          temp(i,1:3) = mycolor(2+i);
  end
  Styles.ebcolor = temp;
end
if ~isfield(Styles,'pointcolor') % pointbar color 
  Styles.pointcolor = Styles.ebcolor;
end

 if ~isfield(Styles,'jitter') % pointbar color 
  Styles.jitter = 0.2;
 end
jit = 0; % first group
stit = 1; % first point style
 %% plots 

 for c = 1:length(cat2)
       subdata = castdata(data(group2==cat2(c)), group1(group2==cat2(c)) );
       STE = nanstd(subdata)./sqrt(sum(~isnan(subdata)));% standard error 
      [n,p] = size(subdata);
      EBcolor = Styles.ebcolor(c,:);
      Pcolor = Styles.pointcolor(c,:);
     
 if n > 1 % num
       errorbar((1:p) + jit * (Styles.jitter), nanmean(subdata),STE,mystyle(stit),'Color',EBcolor,'LineWidth',2, 'MarkerSize', 2,'MarkerFaceColor',EBcolor); hold on
       h(c) = plot((1:p) + jit * (Styles.jitter), nanmean(subdata,1),mystyle(stit),'Color',EBcolor,'MarkerSize', 6,'MarkerFaceColor',EBcolor) ; hold on    
 else
         if n<4 && n>1 % n : the number of data points
            Styles.DataPointsOn = 1  ;      
         end
 h(c)=  plot((1:p) + jit * (Styles.jitter), nanmean(subdata,1),mystyle(stit),'Color',EBcolor,'MarkerSize', 6,'MarkerFaceColor',EBcolor) ; hold on    
 end
    %   end
% end

%%%%%% Data points
if isfield(Styles,'DataPointsOn') && Styles.DataPointsOn==1  
    for P=1:p
        A = subdata(:,P);
       plot(repmat(P+0.1+ jit * (Styles.jitter),1,sum(isnan(A)==0) ),A(isnan(A)==0),mystyle(stit),'MarkerSize', 4,'color',Pcolor,'Markerfacecolor',Pcolor);
    end
end

jit = jit + 1;
stit = stit +1;
 end
%%
if ~isfield(Styles,'LegendOn') 
Styles.LegendOn=1 ; 
end
if Styles.LegendOn==1  
    if length(cat2) > 1
        legend([h], cat2)
    end
end
 %% Add texts
 set(gca,'FontSize',14,'linewidth',2)  
if isfield(Texts,'xlabels')
   set(gca, 'XTick', 1:length(cat1), 'XTickLabel', Texts.xlabels);
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
   
xlim([0 length(cat1)+1])
box off