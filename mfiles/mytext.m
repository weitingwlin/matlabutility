function mytext(x, y, textin, fsize, Halign, Valign, textcolor, fontname )
%   mytext(x, y, textin, fsize, Halign, Valign, textcolor, fontname)
%
%   defult: fsize = 12
%              Halign = 'center'
%              Valign = 'middle'
%    
%    type `mytext` to see how the alignment argument works
%
%   example: 
%    myplot(0,0);hold on;hline;vline;
%    mytext(0.5, 0.5, 'mytext')
%    mytext(0, 0 ,  'mytext: Arial Black', [], 9, [], 4,'Arial Black')
 %   mytext(0, 0 , 'mytext: Times New Roman', 16, 'L', 'B', 2, 'Times New Roman')
 %   
 %  tip: use ` listfonts` to see available font name
 %
 
    if (nargin < 4 ||isempty(fsize)), fsize = 14; end;
    if (nargin < 5 ||isempty(Halign)), Halign = 'c'; end;
    if (nargin < 6 ||isempty(Valign)), Valign = 'm'; end;
    if (nargin < 7 ||isempty(textcolor)), textcolor = 1; end;
    if (nargin < 8 ||isempty(fontname)), fontname = 'Helvetica'; end;
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
if nargin >1
   text(x , y, ...
         textin, ...
         'fontsize', fsize, ...
         'horizontalalignment', Halign1, ...
          'verticalalignment', Valign1, ...
          'color',  colorcode,...
          'FontName', fontname);
      %  
else
        L = permute(reshape(1:9, 3,3),[2 1]);
            for t1 = 1:9
                    [r, c] = find(L ==t1);
                    plot(c,r, 'b+', 'markersize', 15); hold on
                    mytext(c,r , num2str(t1), 14, t1);
            end
        axis off
end