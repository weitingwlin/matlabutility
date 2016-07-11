%%  bio_diversity
% Calculate biodiveristy indices for each row in matrix X
%
% Including richness local and regional, diversity indices, indices for
% richness, and calssical beta-diveristy indices if input is a matrix.
%
% If input is a vector, ignore the beta, gamma diversity
%% File info
%  Author: Wei-Ting Lin
% 
%  Dependent files: [D_ind_shannon.m]
% 
%  Major references:
% * Anderson et al. (2011) Ecology Letters 14: 19¡V28
% * Smith & Wilson (1996) Oikos, Vol. 76, No. 1
% * How to calculate biodiversity? webpage by Maryland Sea Grant: http://ww2.mdsg.umd.edu/interactive_lessons/biofilm/diverse.htm
function output = bio_diversity (X)

  [N,S] = size(X);% N sites; if 
                  % S species
   if S == 1 
       error('Input must be a vector (row) or a matrix, where each row represent a site.')
   end       
 %% Richness
    R_alpha = sum((X > 0),2);
 %% Shannon
    H_alpha = D_ind_shannon(X);
    H_even = H_alpha./log(R_alpha);% Peilou(1975); J'  sensu. (Smith & Wilson, 1996) 
%% Simpson
        Xpi = X./repmat(sum(X,2),1,S);
     D = sum(Xpi.^2,2);
     D_diversity = 1-D; % 1-D
     D_reciprocal =1./D; % 1/D
     D_even = D_reciprocal./R_alpha ; % E_1/D sensu. (Smith & Wilson, 1996) 
%% Evenness index Evar  (Smith & Wilson, 1996) 
        K  = (X == 0);
        MlogX = sum(log(X+K),2)./R_alpha;
        VarlogX = (sum( ((log(X+K)-repmat(MlogX,1,S)).*(X~=0)).^2  ,  2) )./R_alpha;
        % This step is tricky: 
             % "log(X+K)" temporaryly fill the zeros with ones
             % ".*(X~=0)" remove the data from zeros
     Evar = 1-2/pi*atan(VarlogX);
%% Metacommunity diversity
if N > 1 % input contain data from more than 1 site
    R_gamma = sum( sum(X) >0 , 2 ); % gama diversity
    R_beta_w = R_gamma/mean(R_alpha);
    R_beta_add =  R_gamma - mean(R_alpha);
    H_gamma = D_ind_shannon( sum(X) );   
    H_beta = (exp(H_gamma)) / (mean(exp(H_alpha)));
    
    % output
    output.R_gamma = R_gamma; % Reginal scale (gamma) Richness
    output.R_beta_w = R_beta_w; % Beta-diveristy by (Whittaker, 1960)
    output.R_beta_add = R_beta_add; % Additive version of classical beta-diversity
    output.H_gamma = H_gamma; % Shannon diveristy at regional  (gamma) scale
    output.H_beta = H_beta; % Beta diversity based on Shannon index (Jost, 2007)
end
%% Output
output.R = R_alpha; % local (alpha) richness
output.H = H_alpha; % local Shannon diversity index
output.H_even = H_even;  %  Evenness index, J' sensu. (Smith & Wilson, 1996) 
output.D = D;  % Simpson's dominance index
output.D_diversity = D_diversity; % 1-D  : Simpson's diversity index
output.D_reciprocal = D_reciprocal; % 1/D : Simpson's reciprocal index
output.D_even =  D_even; % Evenesee index ,E_1/D sensu. (Smith & Wilson, 1996) 
output.Evar = Evar;  % Evenness index, Evar sensu. (Smith & Wilson, 1996) 
