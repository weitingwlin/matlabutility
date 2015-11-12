% [balls]         : vector of numbers, represent the balls
% [weights]       : relative chance of these balls to be drawn
%                     default : [ 1 1 1 ¡K..] 
% [W]             : one number drawn from [ball]
% 
% 2015/09/07: fix problem with [weights] input; can be verticle or horizontal vectors now 
function W = mylottery(balls, weights)
L = length(balls);
if (nargin < 2), weights=ones(1,L); end;
% transfer [weights] si the sum of [target] is 1

[n,p]= size(weights);
if n>1 && p==1
    weights=weights';
end
target = weights/sum(weights,2);

% target_C is the marks that seperate each interval 0~1

target_C(1) = target(1); 
target_C(L) = 1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if L > 2
    for b = 2:(L-1)
        target_C(b) = sum(target(1:b),2);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=rand; 
for i = L:(-1):1
    if A < target_C(i)
        W = balls(i);
        % the value of W will move from L to the smallest target 
    end
end


