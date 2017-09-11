% Calculate CI and median of null model for numeric interaction between two  species
% 
% dependent: [nancorr.m], [mv_avrg.m] [numInteraction.m]

function  out = numInteraction_bootstrap(MatA, MatB, itteration, replacement, frame)
%% Setting default bootstraping parameters: w/o replacement, 1000 itterations
if ( nargin < 5 ), frame  = 2; end
if (nargin <4),  replacement = false;  end % default is without replacement  
    % convert replacement to logical if it is numeric
    if isa(replacement,'double') == 1
        replacement = logical(replacement);
    end
if (nargin <3),  itteration = 1000;  end
    if itteration < 10
        error('number of itteration too small')
    end

%% calculate the "Data" interaction
effectAB = numInteraction(MatA,MatB, [], [], frame);

%% calculate the null model
     [n, p] = size(MatA);
%%% Prepare sheet
AonB = zeros(itteration,1);
BonA = zeros(itteration,1);

%%% Do simulation
for t = 1: itteration
    % create permutated data
    shA = datasample(MatA, n, 1, 'replace', replacement); % shuffle the patch(plant) ID of the data
    shB = datasample(MatB, n, 1, 'replace', replacement);
    output = numInteraction(shA, shB, [], [], frame); % calculate numeric interaction indices
   AonB(t) = output.AonB_R;
   BonA(t) = output.BonA_R;
end

% Calculate CI and median
ciAonB = quantile(AonB,[0.025 0.975],1); % get 95%, 2-tail confidence interval for each column in TDsh
ciBonA = quantile(BonA,[0.025 0.975],1);
medAonB = median(AonB);
medBonA = median(BonA);
%%
out = struct('ciAonB',ciAonB,'ciBonA',ciBonA,'medAonB',medAonB, 'medBonA',medBonA,...
                  'AonB', effectAB.AonB_R, 'BonA', effectAB.BonA_R, ...
                   'p_AonB', pval(effectAB.AonB_R, AonB, 2),   'p_BonA', pval(effectAB.BonA_R, BonA, 2));
