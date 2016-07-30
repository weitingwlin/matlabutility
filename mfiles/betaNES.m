% calculate 3 kinds of beta diversity indices
%  
% used in  null_betaNES
%
% ref. Baselga, 2010, Global Ecol. Biogeogr.
function betas = betaNES(matin) 
%% 
matin01 = matin > 0; % to a presence-absence matrix
                              % the rest base on this
[ N, P ] = size(matin01);
%% calculate unique species, b, c, for each pair of communities
% alpha for each community and gamma
    alphas = sum(matin01, 2); % alpha richness
    gamma = sum( sum(matin01) > 0 , 2); % total number of species   
a = sum(alphas) - gamma; % multi-site a


minb = 0; % initiated
maxb = 0;

for i = 1 : (N-1)
        for j = (i + 1) : N % this is how you get all unique paires
            b = ((matin01(i, :) == 1) +  (matin01(j, :) == 0)) == 2   ;
            c = ((matin01(i, :) == 0) +  (matin01(j, :) == 1)) == 2   ;
            minb = minb + min( [ sum(b) sum(c) ] );
            maxb = maxb + max( [ sum(b) sum(c) ] );
        end
end
%% indices
        betas.sor = (minb + maxb)/(2*a + minb +maxb);
        betas.sim = minb/(a + minb);
        betas.nes = betas.sor - betas.sim;