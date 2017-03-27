% calculate Shannon diversity index from site-species data
% Wei-Ting Lin    2014/09/07
% 
function Ind = D_ind_shannon(X) 

[N,S] = size(X);% N sites
                       % S species
                   
 K = (X == 0) ; % 1 for where data is 0 
 % transfer original data into 
 Xpi = X./repmat(sum(X, 2), 1, S);
 Ind = (-1) * sum( Xpi .* log(Xpi + K) ,2);
     % Add K to avoid log(0), will not affect sum becaused log(1)=0. 
 