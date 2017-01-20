function myLatext(x, y, textin, fsize, Halign, Valign, textcolor)
%   myLatext(x, y, textin, fsize, Halign, Valign, textcolor)
%
%   defult: fsize = 12
%              Halign = 'center'
%              Valign = 'middle'
%
%   example: 
%    myplot(0,0);hold on;hline;vline;
%    myLatext(0.5, 0.5 ,'mytext $N_{i,j}^2$')
%    myLatext(0, 0 ,  'mytext', [], 9)
 %   myLatext(0, 0 , 'mytext $\alpha$', 16, 'L', 'B')
 %
    if (nargin < 4 ||isempty(fsize)), fsize = 14; end;
    if (nargin < 5 ||isempty(Halign)), Halign = 'c'; end;
    if (nargin < 6 ||isempty(Valign)), Valign = 'm'; end;
    if (nargin < 7 ||isempty(textcolor)), textcolor = 1; end;
%%
if Halign == 'c'||Halign == 'C' || any(Halign == [2  5 8])
    Halign1 = 'center';
end
if Halign == 'L' ||Halign == 'l'|| any(Halign == [1 4 7])
    Halign1 = 'left';
end
if Halign == 'R' ||Halign == 'r'|| any(Halign == [3 6 9])
    Halign1 = 'right';
end    

if Valign == 'm'||Valign == 'M' || any(Halign == [4  5  6])
    Valign1 = 'middle';
end
if Valign == 'b'||Valign == 'B'  || any(Halign == [ 1  2 3])
    Valign1 = 'baseline';
end
if Valign == 'c'||Valign == 'C'  ||Valign == 't'||Valign == 'T'  || any(Halign == [ 7  8  9]) % or "Top"
    Valign1 = 'cap';
end

if length(textcolor) == 1
        if isnumeric(textcolor)
            colorcode = mycolor(floor(textcolor));
        else
            colorcode = textcolor;    
        end
else
        if length(color)==3
                colorcode = textcolor;    
        else
                error('input [color] should be an interger (select from [mycolor]) or a 3-number color code')
        end
end

%%
   text(x , y, ...
         textin, ...
         'fontsize', fsize, ...
         'Interpreter', 'latex', ...
         'horizontalalignment', Halign1, ...
          'verticalalignment', Valign1, ...
          'color',  colorcode)