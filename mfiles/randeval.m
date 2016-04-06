% visualize the distribution of input equation with random elements
% [equation] : a string ; e.g. 'rand(1)*2-1'
function [h, out] = randeval( equation, rep, seed)
  % get a sample answer    
       ans0 =  eval(equation) ; % do this before setting seed   
if (nargin == 3), rng(seed); end
if (nargin < 2), rep = 100; end
  
 if isscalar(ans0)
        out = zeros(1, rep); 
        % simulation
        for i = 1:rep
                out(i) =  eval(equation);
        end
      hist(out); hold on
      vline(mean(out), 7, ':')
 end
  
