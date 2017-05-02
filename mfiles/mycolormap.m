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
function mymap = mycolormap(c, mode, c2)
if nargin == 1
    mode = 1;
end

if ischar(c) && mode == 1
        [mymap, ~] = mycolorstring(c);
else
        % get the full scale color 
        if ischar(c)
        [~, tc] = mycolorstring(c);
        end
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
        end
        % make color map
        if mode == 1
                mymap =  [linspace(1, tc(1), 64)' linspace(1, tc(2), 64)' linspace(1, tc(3), 64)'];
        else % mode == 2
            if nargin <=2
               csum = sum(tc); % top RGB score
               bc = ([1 1 1] - tc)/sum ([1 1 1] - tc) * csum;
            else
                bc = c2;
            end   
               mapt = [linspace(1, tc(1), 32)' linspace(1, tc(2), 32)' linspace(1, tc(3), 32)'];
               mapb = [linspace(1, bc(1), 32)' linspace(1, bc(2), 32)' linspace(1, bc(3), 32)'];
               mymap = [flip(mapb); mapt];
        end
end
end

