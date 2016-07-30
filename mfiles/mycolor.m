% Color selecter: generating a 3-number vector code for a color.
% Syntax:
%            code = mycolor(colorcode,selectplate)
% Input:
%        [colorcode]: integer, selecting from the color plate
%                          e.g. colorcode = 3, means a dark blue from the defaultplate 'color'
%                                colorcode = 0 (default): will display the color plate assigned in a new figure
%                                colorcode = -1 ; return the colormap (3 * ?) matrix, specified in [selectplate]
%                                colorcode is a string (passed to selectplate), return colormap (as colorcode = -1);    
%        [selectplate]: a string, assign the plate you want to chose from
%                            'color': default
%                            'redblue': a red to blue bipolor scale
%                            'gray': a gray scale
%        * For detail of color plates type mycolor(0)
%                                                     mycolor(0,'redblue') 
%                                                     mycolor(0,'gray')
% Output: 
%        [code]: a vector of size 3, the code for the selected color
%-------------------------------------------------------------------------------
%
% Example: use in plot function
%
%            plot([1:10], rand(1,10),'color',mycolor(3))
%
% Example: to display color plate
%
%            mycolor(0,'redblue')         % display the red-blue color map
%            mycolor                            % equals to mycolor(0,'color') or mycolor(0), display the default color map
%
% Example: return colormap
%           cmap = mycolor(-1)
%           cmap = mycolor('color')
%           cmap = mycolor('redblue')        
%
% update 2015/09/21: mycolor(0) will display the color plate in a new figure
%                                add an optional input to select 'redblue' and 'gray' plate
% update 2015/10/14: can take zero argument
% update 2015/10/29: Add usage as colormap
% update 2016/07/28: Add some colors, and white
function code = mycolor(colorcode, selectplate)
if (nargin < 1), colorcode = 0; end;

if (nargin < 2) 
        if ischar(colorcode)
        selectplate = colorcode; colorcode = -1; % set it -1 so it won't be passed through other output
         % output is the whole colormap   
        else
         selectplate = 'color' ;      
        end
end

%% Making color map

mycolors(1,:) = ([0 0 0]);
mycolors(2,:) = ([0.8 0.2 0.2]);
mycolors(3,:) = ([0.0 0.2 0.6]);
mycolors(4,:) = ([0.1 0.5 0.1]);
mycolors(5,:) = ([0.8 0.7 0.1]);
mycolors(6,:) = ([0.4 0.1 0.8]);
mycolors(7,:) = ([0.4 0.4 0.4]);
mycolors(8,:) = ([0.2 0.7 0.8]);
mycolors(9,:) = ([0.6 0.2 0.2]);
mycolors(10,:) = ([0.8 0.1 0.8]);
mycolors(11,:) = ([0.0 0.4 0.6]);
mycolors(12,:) = ([0.5 0.8 0.0]);
mycolors(13,:) = ([0.9 0.4 0.1]);
% 
mycolors(14,:) =([0.0745    0.2078    0.3686]);
mycolors(15,:) =([0.1765    0.6275    0.6431]);
mycolors(16,:) =([0.3725    0.0588    0.0784]);
mycolors(17,:) =([0.3339    0.3335    0.5202]);
mycolors(18,:) =([0.1373    0.4902    0.3255]);
mycolors(19,:) =([0.7765    0.4510    0.0196]);
mycolors(20,:) =([0.9725    0.9529    0.8431]);
%
mycolors(21,:) =([0.0588    0.2941    0.6353]);
mycolors(22,:) =([0.0784    0.2588    0.0745]);
mycolors(23,:) =([0.6588    0.3529         0]);
mycolors(24,:) =([0.4196    0.5098    0.4314]);
mycolors(25,:) =([0.4980    0.5412    0.0902]);
mycolors(26,:) =([0.9216    0.7961    0.2745]);
mycolors(27,:) =([0.9408    0.9369    0.8114]);
%
mycolors(28,:) =([0.5333    0.7216    0.8471]);
mycolors(29,:) =([0.9373    0.8706    0.7216]);
mycolors(30,:) =([0.9725    0.1804    0.0863]);
mycolors(31,:) =([0.2706    0.3020    0.3569]);
mycolors(32,:) =([0.0980    0.4039    0.2667]);
mycolors(33,:) =([0.9922    0.4392    0.2353]);
mycolors(34,:) =([0 0.9 0]);
mycolors(35,:) =([0.9 1 0.4]);
mycolors(36,:) =([0.2 0.9 1]);
mycolors(37,:) =([0.8 0.5 0.8]);
mycolors(38,:) =([1 0.3 0.3]);
mycolors(39,:) =([0.3 0.3 1 ]);
mycolors(40, :) =([1  1  1] );
%% making a gray map
mygrays(1,:)= ([0 0 0]);
mygrays(2,:)= ([0.3 0.3 0.3]);
mygrays(3,:)= ([0.45 0.45 0.45]);
mygrays(4,:)= ([0.6 0.6 0.6]);
mygrays(5,:)= ([0.8 0.8 0.8]);
mygrays(6,:)= ([0.9 0.9 0.9]);
%% making my red-blue color map
for r = 1:32
myredblues(r,:) = [0.85 0.05 0.05]+[0 0.8 0.8]*(r/33);
end
for b = 1:32
myredblues(b+32,:) = [0.05 0.05 0.85]+[0.8 0.8 0]*((33-b)/33);
end 
%% 
if colorcode > 0
    if strcmp(selectplate,'color')
    code = mycolors(colorcode,:) ;
    else if strcmp(selectplate,'redblue')
              code = myredblues(colorcode,:) ;
           else if strcmp(selectplate,'gray')
                  code = mygrays(colorcode,:) ;
               else 
                    error('input [selectcolor] not recognized');
               end
        end
    end
end
%% If input colorcode == 0, display the color plate
if colorcode==0
    disp('Display color plate for you to chose.')
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    figure
    %%% making color plate for red-blues
      if strcmp(selectplate,'redblue')
          for c = 0:63
                plot([0 cos(0.098*c)],[0 sin(0.098*c)],'Linewidth',3,'color',myredblues(c+1,:));hold on
                text(cos(0.098*c)*1.05,sin(0.098*c)*1.05,num2str(c+1));
          end
      end
      %%% making color plate for [mycolor]
      if strcmp(selectplate,'color')
            [n,p] = size(mycolors);
            for c = 0:n-1
                plot([0 cos(0.15*c)],[0 sin(0.15*c)],'Linewidth',3,'color',mycolors(c+1,:));hold on
                text(cos(0.15*c)*1.05,sin(0.15*c)*1.05,num2str(c+1))
            end
      end
      %%% making color plate for grays
      if strcmp(selectplate,'gray')
          [n,p] = size(mygrays);
          for c = 0:n-1
             plot([0 cos(0.2*c)],[0 sin(0.2*c)],'Linewidth',3,'color',mygrays(c+1,:));hold on
            text(cos(0.2*c)*1.05,sin(0.2*c)*1.05,num2str(c+1));
           end
     end
 axis([-1.1 1.1 -1.1 1.1])
axis off
end

%% If input colorcode == -1, output is the whole colormap
if colorcode == -1
        if strcmp(selectplate,'color')
                code=mycolors;
        end
        if strcmp(selectplate,'redblue')
                code=myredblues;
        end
        if strcmp(selectplate,'gray')
                code=mygrays;
        end
end