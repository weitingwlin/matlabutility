% Calculate numeric interaction between two  species
%
% Numeric interaction : the correlation between "the mean population of spp1" and "the change of population ofspp2" at each time interval. 
% dependent: [nancorr.m], [mv_avrg.m]
% 
% MatA, MatB : population matrix of species A and B. Each has size n x p, population of patch 1~n in time 1~p, each row is
%                     a time-series for a patch, each column is a snapshot
%                     of the community.
% screening :  vector of two elements, default is [0,0], do not filter out data with any zeros. 
%                    First element dictates whether to ignore  double zeros in the "cause" side (X in the correlation). 
%                    Second element dictates whether to ignore double zeros on the "effect" side (Y in the correlation). 
% ploton : show the plots of correlation between the moving average and the difference. 
%
% note 2016/02/19: add ploton option
%
function  effects = numInteraction(MatA, MatB, screening, ploton)
if ( nargin < 4 ), ploton  = 0; end
if ( nargin <3 || isempty(screening)), screening = [0, 0]; end;

% calculate moving average and difference    
    mvA = mv_avrg(MatA); 
    mvB = mv_avrg(MatB); 
    dfA = diff(MatA, 1, 2); 
    dfB = diff(MatB, 1, 2);
% Filtering data where N(t) and N(t+1) are both zeros
%%% On the cause side
    if screening(1) == 1
        mvA(mvA==0) = NaN; % ignore the effect of species absense change 
        mvB(mvB==0) = NaN;
    end
 %%% On the effect side
    if screening(2) == 1
            dfA(mvA==0) = NaN; % ignore 0->0 population change 
            dfB(mvB==0) = NaN;
    end
    
  % Calculate correlation and
    [R, P, N]  = nancorr(mvA(:),dfB(:));
            effects.AonB_R = R;
            effects.AonB_P = P;
            effects.AonB_N = N;
    [R, P, N]  = nancorr(mvB(:),dfA(:));
            effects.BonA_R = R;
            effects.BonA_P = P;
            effects.BonA_N = N;
    % Plot
            if ploton==1
                figure
                subplot(1,2,1)
                myplot_ls(mvA(:), dfB(:), 28,1);
                subplot(1,2,2)
                myplot_ls(mvB(:), dfA(:), 28,1);
            end
