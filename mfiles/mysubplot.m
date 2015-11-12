%% Create subplots with Major title
% Usage:
% to make subplot:
%                  mysubplot(L,W, ID,'Title')
%                  [L], [W],: the dimension of subplots as in subplot(L,W,ID)
%                  [ID]: the location of subplot as in subplot(L,W,ID);
%                          to make larger subplot, make [ID] a vector with IDs of multiple cells
% to make major title:
%                 mysubplot(L,W, 0,'Title')
%                                      _set ID=0_               
%                 [L], [W]: the dimension of subplots as in mysubplot(L,W,ID)
%
% For example of usage, see [X_mysubplot.m], or the html file
%
% Wei-Ting Lin 2015/09/21
 
function mysubplot(L,W,ID,bigtitle) % ID=0 means title 
if  (nargin < 4), bigtitle = ''; end 

if ID>L*W
error('ID > number of subplot');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
margin = 0.05;
padW =0.30/W;% padding on the width
padL =0.30/L;
titleH = padL;
plotW =( 1-margin*2) / W; % width of each subplot
plotH = (1-titleH-margin*2) /L; % height
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making title
if ID==0
subplot('position',[0  1-titleH   1  titleH ])% new Length of the whole figure is (11/10)*LCM
axis([-1 1 -1 1])
text(0,0,bigtitle, 'VerticalAlignment','Middle','HorizontalAlignment','Center','FontSize',16)
box off
axis off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Making subplot
else 
    if length(ID)==1
    r = ceil(ID/W);% which row in the plot
    c = round(mod(ID-0.1,W)); % witch column in the plot
    positionL = margin+(plotW)*(c-1)+padW ;%left point
    positionB = 1 - (r*(plotH)+margin+titleH)+padL;% bottom point
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    subplot('position', [positionL positionB plotW-padW plotH-padL])
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    else % conbining multiple cells to one subplot
        combL = length(ID) ;
        for p = 1:combL
            r(p) = ceil(ID(p)/W);% which row in the plot
            c(p) = round(mod(ID(p)-0.1,W)); % witch column in the plot
        end
           BottomLeft = find(c==min(c)&r==max(r)); % the cell on the left bottom corner
           TopRight = find(c==max(c)&r==min(r)); % the cell on the top right corner

                if length(BottomLeft)~=1 || length(TopRight)~=1 
                    error('input cell IDs will not make a square')
                end
           NCellH = c(TopRight)-c(BottomLeft)+1;% number of cell horizontally
           NCellV = r(BottomLeft)-r(TopRight)+1;% number of cell vertically
                if length(ID) ~= NCellH*NCellV
                % expected numver of cell is not equal to input number of cell
                    error('input cell IDs will not make a square')
                end
           
           % calculate subplot location based on the bottom-left cell
           positionL = margin+(plotW)*(c(BottomLeft)-1)+padW ;%left point
           positionB = 1 - (r(BottomLeft)*(plotH)+margin+titleH)+padL;% bottom point
           % calculate subplot size based on number of cells horizontally and vertically
           
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
           subplot('position', [positionL   positionB  plotW*NCellH-padW     plotH*NCellV-padL])
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
   
end
