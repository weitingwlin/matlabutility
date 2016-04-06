% S: Species count
% N: individual count
% iterationlimit
% 
% ref. Rosenzweig, 1995, Species Diversity in Space and Time.  pp.193-194
function alphaF = fisher_alpha(N, S,  iterationlimit, eps)
if S > N
    error('S cannot be larger then N')
end
%% default values
    if nargin < 4
            eps = 0.00001;
    end
    if nargin < 3
            iterationlimit = 100;
    end
%% initial value: try to avoid overshooting  
        Xs = [0.05: 0.05: 0.95];
        fXs = (Xs-1)./Xs .* log(1-Xs)  -S/N;
    X =  Xs(abs(fXs)==min(abs(fXs))) ; % the initial value; where fXs closest to zero
%% Newton's method: find the value of X
for i=1:iterationlimit
     fX = (X-1)./X .* log(1-X)  -S/N; % f(X)
 
     % Check point
     if abs(fX) < eps % break is result is close enough 
            break
     end
    % if not satisfied, do another estimate
     dfX = log(1-X) ./ (X.^2) + (1/X); % f'(X); the slope
     Xt = X - fX/dfX; % the next estimation of X
     X = Xt; % update
end
%% alpha
alphaF = N*(1-X)/X;
