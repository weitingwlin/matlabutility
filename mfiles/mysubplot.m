%% Create subplots with Major title
% Usage:
%
% to make subplot:
%                  mysubplot(L, W, ID, Title, tightL, tightW)
%                  [L], [W],: the dimension of subplots as in subplot(L,W,ID)
%                  [ID]: The location of subplot as in subplot(L,W,ID);
%                            to make larger subplot, make [ID] a vector with IDs of multiple cells
%                  [tightW], [tightL]: How tight the subplots packed, on the first and secand dimension. 
%                                                  Or the ratio of space between subplots to the size of subplot. 
%                                                  Default : 0.3, 0.3                                                  
%                                   
% to make major title:
%                 mysubplot(L,W, 0,Title)
%                                      _set ID=0_               
%                 [L], [W]: the dimension of subplots as in mysubplot(L,W,ID)
%                 [Title]: string of the major title
%
%  to display cell layout: 
%                mysubplot(L, W)
% For examples of usage, see [X_mysubplot.m]
%
% Wei-Ting Lin 2015/09/21
% edit line 44, 71, left margin add padW/2
 
function mysubplot(L, W, ID, bigtitle, tightL, tightW) % ID=0 means title 
if  (nargin < 3|| isempty(ID)), ID = -1; end % when ID = -1 the function will print out the subplot layout 
if  (nargin < 4|| isempty(bigtitle)), bigtitle = ''; end 
if  (nargin < 5 || isempty(tightL)), tightL = 0.3; end 
if  (nargin < 6), tightW = 0.3; end 

if ID>L*W
error('ID > number of subplot');
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
margin = 0.05;

titleH = 0.3/L;
plotW =( 1-margin*2) / W; % width of each subplot
plotH = (1-titleH-margin*2) /L; % height

%padW =0.3/W;% padding on the width
%padL =0.3/L;
padW = tightW * plotW;
padL =tightL * plotH;
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
        if ID ==-1 % marker of "display cell layout"
               figure
               mysubplot(L,W, 0, 'subplot cells layout')
               for i = 1: L*W
                   mysubplot(L,W, i)
                   myplot(1,1, 'S', 40); 
                       set(gca,'xtick',[]); set(gca,'ytick',[])
                   text(1,1, ['ID = ' num2str(i)], 'fontsize', 16, 'Horizontalalignment', 'center')
               end
        else 
    %This is the part of the function parallele to subplot
                r = ceil(ID/W);% which row in the plot
                c = round(mod(ID-0.1,W)); % witch column in the plot
                positionL = margin+(plotW)*(c-1)+padW/2 ;%left point
                positionB = 1 - (r*(plotH)+margin+titleH)+padL;% bottom point
    
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                subplot('position', [positionL  positionB  plotW-padW  plotH-padL])
                %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        end
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
           positionL = margin+(plotW)*(c(BottomLeft)-1)+padW/2 ;%left point
           positionB = 1 - (r(BottomLeft)*(plotH)+margin+titleH)+padL;% bottom point
           % calculate subplot size based on number of cells horizontally and vertically
           
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
           subplot('position', [positionL   positionB  plotW*NCellH-padW     plotH*NCellV-padL])
           %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
   
end
