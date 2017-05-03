%%  
%   SYNTAX
%              rgbcode = str2rgb(c)
%
%    c: a string of colorname
%
%    colornamelist
%%
function rgbcode = str2rgb(c)

                A.red = [1, 0, 0];  A.blue = [0 0 1];  A.green = [0 1 0]; 
                A.yellow =[1 1 0]; A.magenta = [1 0 1]; A. cyan = [0 1 1];
                A.violet = [238 130 238]/256;
                A.indigo = [75, 0, 130]/256;
                A.purple = (A.red + A.blue)/2;
                A.olive =(A.red + A.green)/2;
                A.teal =(A.blue + A.green)/2;
                A.orange = [1, 0.5, 0];
                colorlist = fields(A);
                
        switch nargin
            case 0   
                rgbcode = colorlist;
                x = linspace(0, pi , 100);
                for i = 1: length(colorlist)
                        plot(x +i, sin(x) ,  'color', A.(colorlist{i}) , 'linewidth', 3); hold on
                       ht =  text(pi/2 + i, 1, colorlist{i}, 'fontsize', 16, 'VerticalAlignment', 'bottom');
                       set(ht, 'Rotation', 30);
                end
                axis([1, (length(colorlist)+1 + pi),   0.4 ,1.2]);
                box off
                axis off
            case 1
                if any(strcmp(c, colorlist))
                        rgbcode = A.(c);   
                else
                        error('type `str2rgb` to see the colorname list');
                end
            otherwise
                error('take only one input')
        end
end 
