% print matrix and color code the values
%
% SYNTAX
%          [im, hcb] = mytable(A, fullcolor, fsize, fname, fullscale, mode, negcolor)
%
%  examples:
%
%  mytable(magic(5));
%
%       A = [1 2 3 ; 4 5 6; 0 0 10]
%  [im, hcb] = mytable(A, 'orange', 14, 'Times New Roman');
%       set(hcb,'YTick', [0 1 2 10]);
%       im.AlphaData = 0.8;
%
%       B = [1 2 -3 ; 4 5 -6; 0 0 1]
%      [im, hcb] = mytable(B, 'blue', 14, [], [], 2, 'red');


function [im, hcb] = mytable(A, fullcolor, fsize, fname, fullscale, mode, negcolor)
    if (nargin < 2 ||isempty( fullcolor)),  fullcolor = 3; end;
    if (nargin < 3 ||isempty(fsize)), fsize = 10; end;
    if (nargin < 4 ||isempty(fname)), fname = 'Helvetica'; end;
    if (nargin < 5 ||isempty(fullscale)),  fullscale = max(abs(A(:))); end;
    if (nargin < 6 ||isempty(mode)), mode = 1; end;
    if (nargin < 7 ||isempty(negcolor)), negcolor = []; end;

if mode == 1
        im = imagesc(A, [0, fullscale]); hold on
        if min(A(:)) < 0
                    warning('Negative values are not visualized. (use mode = 2 instead)')
        end
else       
       im = imagesc(A, [-1*fullscale, fullscale]); hold on   
end
 colormap(mycolormap(fullcolor, mode, negcolor));
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