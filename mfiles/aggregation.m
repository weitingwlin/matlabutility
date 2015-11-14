%% Indices for inter- and intra-species aggregation
%
% ref. Sevenster (1996) Aggregation and Coexistence. I. Theory and Analysis
%   
%  J: intra species aggregation
%  C: inter species aggregation
%  A: relative strength of J and C
%
% depend on covcc.m

function index = aggregation(varargin)
if nargin ==1
        index = aggregationJ(varargin{1});
end

if nargin == 2
        index = aggregationC(varargin{1},varargin{2});
end

if nargin > 2
        error('Under construction')
end


end

%% local function 1: 
function indexC = aggregationC(Mat1,Mat2)
    Xs1 = Mat1(:,all([any(Mat2>0,1);any(Mat1>0,1)])); %  ignoring times that both species are absent 
    Xs2 = Mat2(:,all([any(Mat2>0,1);any(Mat1>0,1)]));

    Ms1 = nanmean(Xs1); % mean local population for each temporal snapshot
    Ms2 = nanmean(Xs2); 
    Covs = covcc(Xs1,Xs2);

    Mall1 = nanmean(Mat1(:));
    Mall2 = nanmean(Mat2(:));
    Covall = cov(Mat1(:),Mat2(:));

    ind1 = aggregationJ(Xs1);
    ind2 = aggregationJ(Xs2);
    
    indexC.Ct = Covs ./ (Ms1 .* Ms2); % intraspecies Aggregation overtime 
    indexC.Call = Covall(2) / (Mall1 .* Mall2); 
    indexC.Jt{1} = ind1.Jt;
    indexC.Jt{2} = ind2.Jt;
    indexC.Jall(1) = ind1.Jall;
    indexC.Jall(2) = ind2.Jall;
    indexC.At = (1+ ind1.Jt) .* (1+ ind2.Jt) ./((1 + indexC.Ct) .^ 2);
    indexC.Aall = (1+ ind1.Jall) * (1+ ind2.Jall) /((1 + indexC.Call)^ 2);
end
%% local function 2: intra-species aggregation
function indexJ = aggregationJ(Mat)

Ms = nanmean(Mat(:,any(Mat > 0, 1))); % mean local population for each temporal snapshot
Vs = nanvar(Mat(:,any(Mat > 0, 1)));
Mall = nanmean(Mat(:));
Vall = nanvar(Mat(:));

indexJ = [];
indexJ.Jt = Vs./(Ms.^2) - 1./Ms; % intraspecies Aggregation overtime 
indexJ.Jall = Vall/(Mall^2) - 1/Mall; 

end
