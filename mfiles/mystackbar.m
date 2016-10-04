% Make a single stacked bar graph (somehow it doesn't work with the built in function `bar`)
%
% SYNTAX
%       h = mystackbar(v, colors);
%       
%             v: the vector to plot
%             colors: the color (code, rgb, or letter)
%   
% Examples:
%       mystackbar([1 2 3 4])
%       mystackbar([1 2 3 4], [0 0 0 ;1 1 0; 0 0 1; 0 1 0])
%       mystackbar([1 2 3 4], ['k'; 'r';'y'; 'b'])
%       mystackbar([1 2 3 4], [21 22 23 24])
function h = mystackbar(v, colors)
L = length(v);
if nargin <2
        colors = [3: (2+L)];
end

[j, k] = size(colors);
if (j==1 ||k==1) && isnumeric(colors) % read the colors as code
    col = zeros(length(colors), 3);
    for c = 1: length(colors) 
        col(c, :) = mycolor( colors(c) );
    end
else
    col = colors;
end
for i =1 : L
        i2 = L-i+1;
        bar( sum(v( 1 : i2 ) ), 'FaceColor',  col(i2, :))    ;    hold on
end
 set(gca, 'linewidth',2, 'xtick', [], 'box', 'off')
