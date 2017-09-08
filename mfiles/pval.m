% calculating p value against null model
function [p, pctile, h] = pval(x, nullx, tail, ploton) 
if nargin < 3
    tail = 1;
end
if nargin < 4
    ploton = 0;
end

  it = length(nullx);
  pctile =  (sum(nullx < x) + sum( nullx == x ) * 0.5) / it;
  
  p = min(pctile, 1 - pctile);
  
  h = [];
  if ploton == 1
        h.hist = histogram(nullx, 20); hold on
        h.hist.EdgeColor = 'w'; 
            box off
        % calculate quantiles
        q1 = quantile(nullx, [  0.5 ], 2);
        h.v1 =  vline(q1, 7, '--');  
        if tail ==2
               q2 = quantile(nullx, [0.025  0.975], 2);
        else
                q2 = quantile(nullx, [0.95], 2);
        end
        for q = 1:length(q2)
                h.v2{q} =  vline(q2(q), 7, ':'); % gray
        end        
        h.v3 = vline( x, 2); % red
        legend([h.v1, h.v2{1}, h.v3], {'median', '95% CI', 'actual data'})
  end
  
   p = p * tail;