% A function that "samples" a population at fixed time point
% 
% Example:
%      X = repmat(1:100,5,1) + rand(5,100);
%       ts =[1: 5, 7,9 ,10:10:100];
%      Xs = fixsample(1:100, X, ts, [], 2);
%      myplot( 1 : 100, X(1, :),'L' );hold on
%      myplot( ts, Xs(1, :),'S' ,2);

function Xsample = fixsample(t, X, tsample, X0, dimt)

if nargin < 5
    dimt = 2; % dimmention that represents time in a matrix
end
if nargin < 4 || isempty(X0)
    if isvector(X)|| dimt == 2
    X0 = X(:,1);
    else
     X0 = X(1,:);   
    end
end
%% simulate fix time point sample
S = length(tsample);

if isvector(X)
        Xsample = nan(size(tsample));
        for s = 1 : S
                trec = tsample(s);
                ID = max(find(t' <= trec));
                if isempty(ID)
                        Xsample(s) = X0; 
                else
                        Xsample(s) = X( ID) ;
                end
        end
else % matrix
            temp = size(X); temp(dimt) = S;
        Xsample = nan(temp);
        if dimt == 2
                for s = 1 : S
                        trec = tsample(s);
                        ID = max(find(t' <= trec));
                        if isempty(ID)
                                Xsample(:, s) = X0; 
                        else
                                Xsample(:, s) = X(:, ID) ;
                        end
                 end
        else 
                    if dimt == 1
                            for s = 1 : S
                                    trec = tsample(s);
                                    ID = max(find(t' <= trec));
                                    if isempty(ID)
                                            Xsample(s,:) = X0; 
                                    else
                                            Xsample(s,:) = X(ID, :) ;
                                    end
                            end
                    else
                        error('dimention should be 1 or 2');
                    end
        end
end