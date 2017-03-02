% plot NMDS result with score and vectors

function [h] = plot_NMDS2(Y, vec, groups, labels, groupcolormap, veclabels, nplots)
n = length(Y(:,1)); % number of species
if (~isempty(vec))
    p = length(vec(:,1)); % number of vector
end
% 
% Data should be transformed for better normality and/or standardized
if (nargin < 3), groups = ones(n,1); end;
if (nargin < 5), groupcolormap = 'parula' ;end;
if (nargin < 7), nplots = 1 ;end

color = 1:10;   
if nargin < 4
    labels = [];
end
if isnumeric(labels) && ~isempty(labels)
        color =  labels;
end
 stylesheet = {'o', 's','d','^','p','>','<', 'o', 's','d','^','p','>','<','o', 's','d','^','p','>','<',...
                         'o', 's','d','^','p','>','<', 'o', 's','d','^','p','>','<','o', 's','d','^','p','>','<'};

                     

%% rescale NMDS scores
        scale = max(ceil(...
                            max( [ max(Y);  abs(min(Y)) ] )...
                            ));
        Y = Y/scale;

%% NMDS scores
h = []; % output graph handle
if isa(groups,'double')==1
    grouplist = unique(groups);
    % List of unique value in the group
        for i=1:length(grouplist)
            if length(grouplist) <= 10 
                % fewer groups use mycolor
                   h{1}(i)= myplot(Y(groups == grouplist(i), 1),Y(groups == grouplist(i),2),'S', color() ,i) ; hold on   
                    if (nargin >= 2)
                        legend(h{1}(i), num2str(grouplist)); 
                    end
            else
                % too many groups use colormap
                  h{1} = scatter(Y(:,1), Y(:,2), 40 , groups, 'filled')   ; hold on                  
                   set(gca,'FontSize',14,'linewidth',2);             
                         colormap(groupcolormap);
                   h{3} =   colorbar;
            end
        end
  
elseif isa(groups,'cell')==1
    grouplist2 = unique(groups);
        for i=1:length(grouplist2)
           h{1} = myplot(Y(strcmp(groups,grouplist2(i)),1), ...
                               Y(strcmp(groups,grouplist2(i)),2), ...
                               'S', color(i), stylesheet{i}) ; hold on
        end
        legend(grouplist2)

    else
    error('[groups] should be a numeric vector or a cell array of atring')
end

         axis([-1.1  1.1  -1.1  1.1])

        h1 = hline(0, 7, ':'); uistack(h1, 'bottom');
        h2 = vline(0, 7, ':'); uistack(h2, 'bottom');
           % xticks([-1 -0.5 0 0.5 1]);
        %yticks([-1 -0.5 0 0.5 1]);
        set(gca, 'Xtick', [-1 -0.5 0 0.5 1]);
        set(gca, 'Ytick', [-1 -0.5 0 0.5 1]);
        xlabel('NMDS 1')
        ylabel('NMDS 2')
%% Vectors
if ~(nargin < 2 || isempty(labels) || isnumeric(labels))
    for i = 1 : length(Y(:,1))
        text(Y(i,1),  Y(i,2), labels(i))
    end
end

%%
if ~isempty(vec) % plot vector only when they are available
        if (nargin < 6) 
                veclabels = num2cell(1:p);
        end;
        % whether to make a separate plot
        if nplots == 2
            figure
        end
        %%%%%%%%%%%%%
        % plotting the vectors
        for v = 1:p
                myplot_vec(vec(v,1), vec(v,2), veclabels(v), 1, [], [], 14); hold on
        end      
end
% in case of two plots, the axes are consistant
          axis([-1.1  1.1  -1.1  1.1])
if nplots == 2          
h1 = hline(0, 7, ':'); uistack(h1, 'bottom');
h2 = vline(0, 7, ':'); uistack(h2, 'bottom');
       % xticks([-1 -0.5 0 0.5 1]);
        %yticks([-1 -0.5 0 0.5 1]);
        set(gca, 'Xtick', [-1 -0.5 0 0.5 1]);
        set(gca, 'Ytick', [-1 -0.5 0 0.5 1]);
        xlabel('NMDS 1')
        ylabel('NMDS 2')
end