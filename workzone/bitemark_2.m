% Function used to convert observed number of leaves with bite marks to
% estimated number of bite
% Wei-Ting Lin 2015/07/23
function [Z, freqs, Zcand] = bitemark_2(X,Y,it,maxZ, max_bite)
% X: number of leaves
% Y: number of leaves with bite mark
% it: number of iteration, default is 1000
% maxZ: set a hard limit for Z output, default is Y*2
% max_bite: number of bites one leave can take. Also assumed is that after
% each bite the leave will be 1/max_bite less likely to be bit. 
% Z: number of bite with max likelihood
if (nargin < 5), max_bite = 5; end; 
if (nargin < 4), maxZ = Y*2; end;
if (nargin < 3), it = 1000; end;

Zcand = [Y:maxZ]; % candidate of number of bite (Z) 

freqs= zeros(length(Zcand),1);% sheet for frequency record. freqs(i) is the relative likelihood of having Y leave damaged given Z bites, Z = Zcand(i). 
parsimony_reached = 0; 
% when Z move up the likelihood of all leaves are bited would increase, but once with certain Z the most likely Y become X, we should stop for parsimony reason.
%% Simulating likelihood for each candidate number of bite (Z)
for j = 1:length(Zcand) 
    Z = Zcand(j); % caculate the most likely number of bited leaves given Z bites
    if parsimony_reached == 0
        temp = zeros(it,1);
    for i=1:it 
        % an event of Z bites, randomly on X leaves
        Leaf = repmat(max_bite,1,X);
        bite = zeros(1,Z);
            for b=1:Z % each bite
            t2 = mylottery(1:X, Leaf); % pick one number from [1:X], with posibility defined in [Leaf]
            Leaf(t2) =  Leaf(t2)-1;% reduced palatability
            bite(b)=t2;
            end
        temp(i)=length(unique(bite)); % "unique" value means the leaves bite at least once
     end
freqs(j) = sum(temp==Y);
% Tabulate to check parsimony
T=tabulate(temp);
parsimony_reached = (find(T(:,2)==max(T(:,2))) == X);
    end
end
%%

Z = Zcand( median( find(freqs==max(freqs)) ) );

