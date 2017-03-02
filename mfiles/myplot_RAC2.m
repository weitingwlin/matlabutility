%% myplot_RAC
% This function plots Rank-Abundance Curve. (each community well be presented in subplots, so cannot be embeded in subplot)
%
% depends on: [mycolor.m], [mysubplot.m]
%% *Syntax*
%   myplot_RAC(X)
%       X  :      matrix of size [n, p] ; n communities, p species
%
%  myplot_RAC(X, strs, strn, bigtitle, colorsheet, stylesheet)
%       strs :   string or cell array of strings, the name of the "species"
%                  default is {'spp 1', 'spp 2', ...}; will show as legends
%                  if input is str, will replace the 'spp' in the defult.
%       strn :   string or cell array of strings, the name of the "communities"
%                  default is {'Community 1', 'Community 2', ...}; will show
%                  as title; usage is similar to strs
%      bigtitle :the bigtitle, deafult is 'Rank-Abundance Curve'  
%      colorsheet : the color of each Species, ranked in the first row
%                        if input is only 1 
%      stylesheet : the style of each Species, ranked in the first row
function myplot_RAC2(X, strs, strn, bigtitle, colorsheet, stylesheet, zerooff, tracer)
[n, p] = size( X ); 
defaultsize = 40;
%% Defult names
if nargin <2 || isempty(strs)
    strs = 'spp';
end
if nargin <3 || isempty(strn)
    strn = 'Community';
end
if nargin <4 || isempty(bigtitle)
    bigtitle = 'Rank-Abundance Curve';
end
if nargin <7 || isempty(zerooff)
    zerooff = 0;
end
if nargin <8 
    tracer = 0;
end

%% input names as string
if iscell(strs)
    legends =strs;
    if length( legends) < p
           warning('The number of species does not match with "strs" ');
    end
else
    for s = 1:p
        legends{s} = [strs, ' ', num2str(s)]; 
    end
end

if iscell(strn)
    if length(strn) == n
        titles =strn;
    else
        error('The number of communities does not match with "strn" ');
    end
else
    for c = 1:n
        titles{c} = [strn, ' ', num2str(c)]; 
    end
end

%%

%% Default color
 temp = mycolor(-1) ;
if nargin <5 || isempty(colorsheet)
    colorsheet = temp([3:19, 21:26, 28, 30:39 ],:);   
    if p> 34
            error('number of species is too large; the default color only has 34 colors');
    end
end
[a, b] = size(colorsheet);
    if isvector(colorsheet) && b~=3 && isnumeric(colorsheet)
         colorsheet = temp(colorsheet, :);
    end
    if a == 1       
        colorsheet = repmat(colorsheet, p, 1);
    end
if p > length(colorsheet)
    error('number of species is too large; the default color only has 34 colors');
end

%% Default style
if nargin <6 || isempty(stylesheet)
  stylesheet = {'o', 's','d','^','p','>','<', 'o', 's','d','^','p','>','<','o', 's','d','^','p','>','<',...
                         'o', 's','d','^','p','>','<', 'o', 's','d','^','p','>','<','o', 's','d','^','p','>','<'};
end
if ischar(stylesheet)
    sty = stylesheet; stylesheet =[];
    for i = 1:p
         stylesheet{i} = sty; 
    end
end

if length(stylesheet) < p
    st = stylesheet;
    warning('Input style will be recycled because number of species > number of style')
    while length(stylesheet) < p
       stylesheet = [stylesheet, st];
    end
end

%% The first row
figure
[B, I ] = sort( X( 1, : ), 'descend');

%% reset color and style
C = colorsheet(1:p, :);
colorsheet = C(I,:);
C =stylesheet(1:p);
stylesheet = C(I);
%% make full label
%if n >1
    mysubplot(1, n+2, 0, bigtitle)
  
    if zerooff==1
          mysubplot(1, (n+2)*2, (n+2)*2, '', 0.3, 0.1)
          for s = 1:p
               ranks = find(I==s);
               psize = defaultsize; face = 'none';
                if any(s == tracer)
                psize = 80;
                face = colorsheet(ranks, :);
                end
            h = scatter(ranks , X(1, s) ,psize, stylesheet{ranks},'Markeredgecolor',colorsheet(ranks, :),'Markerfacecolor',face);   hold on         
          h.LineWidth = 1.5;
          end
           legend(legends{:})
           myplot( 1:p, B , 'L', 1);
    end
      mysubplot(1, n+2, 2, '', 0.3, 0.1)
       
%end
%% plot
for s = 1:p
            ranks = find(I==s);
    psize = defaultsize; 
    face = 'none';
    if any(s == tracer)
        psize = 80;
        face = colorsheet(ranks, :);
    end

        if zerooff==1 
            if X(1,s)>0
        h = scatter(ranks , X(1, s) ,psize, stylesheet{ranks},'Markeredgecolor',colorsheet(ranks, :),'Markerfacecolor', face);   hold on         
            h.LineWidth = 1.5;
            end
        else    
               h = scatter(ranks , X(1, s) ,psize, stylesheet{ranks},'Markeredgecolor',colorsheet(ranks, :),'Markerfacecolor',face);   hold on         
      h.LineWidth = 1.5;
        end
end
% the line
    myplot( 1:p, B , 'L', 1); hold on
    if zerooff==0
        legend(legends{:})
    end
        % replot so the symbles are on top
        for s = 1:p
                    ranks = find(I==s);
             psize = defaultsize;
             face = 'none';
                if any(s == tracer)
                psize = 80;
                face = colorsheet(ranks, :);
                end
    
             if zerooff==1 
                 if X(1,s)>0
                h = scatter(ranks , X(1, s) ,psize, stylesheet{ranks},'Markeredgecolor',colorsheet(ranks, :),'Markerfacecolor', face);   hold on 
                       h.LineWidth = 1.5;
                 end
             else
                    h = scatter(ranks , X(1, s) ,psize, stylesheet{ranks},'Markeredgecolor',colorsheet(ranks, :),'Markerfacecolor', face);   hold on 
                    h.LineWidth = 1.5;
             end
        end
     axis([1 p 0 max(max(X))]) ;
     title(titles{1});
  
     ylabel('Abundance');xlabel('Rank')
%%  2~n
X1 =  X( :, I ); % in the new matrix, row 1 is sorted
tracerI = find(any(repmat(I',1, length(tracer) ) == repmat(tracer, length(I) ,1), 2 ) );

for i = 2:n
    mysubplot(1, n+2, i+1,  '', 0.3, 0.1)
    [y, id ] = sort(X1(i,:), 'descend'); 
      myplot( 1:p, y , 'L', 1);hold on
      
    for s = 1:p
                psize = defaultsize;
                face = 'none';
                if any(id(s) == tracerI)
                psize = 80;
                face = colorsheet(id(s), :);
                end
       if zerooff==1 
           if y(s)>0
        h = scatter( s, y(s) ,psize, stylesheet{id(s)},'Markeredgecolor',colorsheet(id(s), :),'Markerfacecolor',face);   hold on 
               h.LineWidth = 1.5;
           end
       else
            h = scatter( s, y(s) ,psize, stylesheet{id(s)},'Markeredgecolor',colorsheet(id(s), :),'Markerfacecolor',face);   hold on  
              h.LineWidth = 1.5;
       end
    end
   box off
     axis([1 p 0 max(max(X))]) ;
        set(gca,'box','off','ycolor','w')
     set(gca, 'ytick', '')
        title(titles{i})
        xlabel('Rank')
end