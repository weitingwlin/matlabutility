% Calculate numeric interaction between two  species
%
% dependent: [nancorr.m], [mv_avrg.m]

function  effects = numInteraction(MatA, MatB)


mvA = mv_avrg(MatA); 
mvB = mv_avrg(MatB); 
dfA = diff(MatA, 1, 2); dfA(mvA==0) = NaN; % ignore 0->0 population change 
dfB = diff(MatB, 1, 2); dfB(mvB==0) = NaN;

        [R,P,N]  = nancorr(mvA(:),dfB(:));
effects.AonB_R = R;
effects.AonB_P = P;
effects.AonB_N = N;
        [R,P,N]  = nancorr(mvB(:),dfA(:));
effects.BonA_R = R;
effects.BonA_P = P;
effects.BonA_N = N;


% default is without replacement 
if (nargin <4),  replacement = false;  end
% convert replacement to logical if it is numeric
if isa(replacement,'double')==1
    replacement=logical(replacement);
end
