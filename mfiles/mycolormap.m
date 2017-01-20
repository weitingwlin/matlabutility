% Making colormap from `mycolor` or input rgb code
%
% SYNTAX
%             mymap = mycolormap(c);
%             
%             c : the color of full scale. Can be a code to select color from `mycolor`, a 3-digid rgb color code, 
%                  or one of the strings: 'red', 'green', 'blue', 'purple', 'teal', 'olive'           
%
% Example:
%           A = [1 2 3 ; 4 5 6; 0 0 10]
%       imagesc(A)
%       colormap(mycolormap(3)); colorbar 
%       colormap(mycolormap('teal'));
%  
function mymap = mycolormap(c)
if isnumeric(c)
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
        mymap =  [linspace(1, tc(1), 64)' linspace(1, tc(2), 64)' linspace(1, tc(3), 64)'];
end

if ischar(c) 
        if any(strcmp('red',{'red', 'green', 'blue', 'purple', 'teal', 'olive'}))
                red = flip(gray);    red(:,1) =1;
                blue = flip(gray);   blue(:,3) =1;
                green = flip(gray);  green(:,2) =1;
                purple = (red + blue)/2;
                olive =(red + green)/2;
                teal =(blue + green)/2;
                if strcmp(c, 'red')
                    mymap = red;
                end
                 if strcmp(c, 'green')
                    mymap = green;
                 end
                 if strcmp(c, 'blue')
                    mymap = blue;
                 end
                 if strcmp(c, 'purple')
                    mymap = purple;
                 end
                 if strcmp(c, 'olive')
                    mymap = olive;
                 end
                 if strcmp(c, 'teal')
                    mymap = teal;
                end
        else
             error('input string should be one of: red, green, blue, purple, teal, olive');
        end
end