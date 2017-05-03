% Making colormap from `mycolor` or input rgb code
%
% SYNTAX
%             mymap = mycolormap(c);
%             
%             c : the color of full scale. Can be a code to select color from `mycolor`, a 3-digid rgb color code, 
%                  or one of the strings: type `str2rgb`to see the color names
%             mode: 1 or 2 for gradient (mode = 1, the default) or bipolor (or, diverging, mode = 2)
%             c2: if mode = 2, this assign the second color (code for
%             smaller values), default is the complementary color of c.
%
% Example:
%           A = [1 2 3 ; 4 5 6; 0 0 10]
%       imagesc(A)
%       colormap(mycolormap(3)); colorbar 
%       colormap(mycolormap('teal'));
%        rng(1);
%       B = randn(5)
%        imagesc(B)
%       colormap(mycolormap('blue', 2, 'orange'));colorbar
function mymap = mycolormap(c, mode, c2)
if nargin == 1
    mode = 1;
end
%%  change colors to rgb code
tc = parsecolor(c);
%% make color map
       switch mode
           case 1
                mymap =  [linspace(1, tc(1), 64)' linspace(1, tc(2), 64)' linspace(1, tc(3), 64)'];
        
           case 2
                    if nargin <=2||isempty(c2)
                        csum = sum(tc); % top RGB score
                        bc = ([1 1 1] - tc)/sum ([1 1 1] - tc) * csum;
                    else
                        bc = parsecolor(c2);
                    end   
                    mapt = [linspace(1, tc(1), 32)' linspace(1, tc(2), 32)' linspace(1, tc(3), 32)'];
                    mapb = [linspace(1, bc(1), 32)' linspace(1, bc(2), 32)' linspace(1, bc(3), 32)'];
                    mymap = [flip(mapb); mapt];
           otherwise
                    error('mode most be 1 or 2')
       end
end

%%
function tc = parsecolor(c)
    if ischar(c) 
        tc = str2rgb(c);
    else       
        if length(c) ==1
                myplate = mycolor(-1);
                tc = myplate(c, :); % top color 
        else
                if length(c) == 3 && all(c <= 1) 
                       tc = c;
                else
                        error('input should be a 3 digit rgb color code or a color selector');
                end
        end
    end
end
