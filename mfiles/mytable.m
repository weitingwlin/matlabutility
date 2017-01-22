% print matrix and color code the values
%
% SYNTAX
%          [im, hcb] = mytable(A, fullcolor, fsize, fname)
%
%  examples:
%
%  mytable(magic(5));
%       A = [1 2 3 ; 4 5 6; 0 0 10]
%  [im, hcb] = mytable(A, 'orange', 14, 'Times New Roman');
%       set(hcb,'YTick', [0 1 2 10]);
%       im.AlphaData = 0.8;

function [im, hcb] = mytable(A, fullcolor, fsize, fname)
    if (nargin < 2 ||isempty( fullcolor)),  fullcolor = 3; end;
    if (nargin < 3 ||isempty(fsize)), fsize = 10; end;
    if (nargin < 4 ||isempty(fname)), fname = 'Helvetica'; end;

im = imagesc(A); hold on
colormap(mycolormap(fullcolor));
% im.AlphaData = .8;
hcb = colorbar;
set(gca,'xtick', [], 'ytick', []);
            [r, c] = size(A);
    for i = 1 : r
            for j = 1 : c
                    mytext(j, i, num2str(A(i, j)), fsize, 5, [], [], fname);
            end
    end
 set(gca,'xtick', [], 'ytick', []);