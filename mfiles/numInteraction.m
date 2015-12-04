% Calculate numeric interaction between two  species
%
% Numeric interaction : the correlation between "the mean population of spp1" and "the change of population ofspp2" at each time interval. 
% dependent: [nancorr.m], [mv_avrg.m]
% 
% MatA, MatB : population matrix of species A and B. Each has size n x p, population of patch 1~n in time 1~p, each row is
%                     a time-series for a patch, each column is a snapshot of the community
function  effects = numInteraction(MatA, MatB)

mvA = mv_avrg(MatA); 
mvB = mv_avrg(MatB); 
dfA = diff(MatA, 1, 2); dfA(mvA==0) = NaN; % ignore 0->0 population change 
dfB = diff(MatB, 1, 2); dfB(mvB==0) = NaN;

        [R, P, N]  = nancorr(mvA(:),dfB(:));
effects.AonB_R = R;
effects.AonB_P = P;
effects.AonB_N = N;
        [R, P, N]  = nancorr(mvB(:),dfA(:));
effects.BonA_R = R;
effects.BonA_P = P;
effects.BonA_N = N;
