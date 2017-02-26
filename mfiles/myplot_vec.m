%% plotting 2D vector 
%
% SYNTAX:
%            [h1, h2] = myplot_vec(a, b,textin,color,Lstyle, Pstyle, fontsize);
%  
%           a, b              : if they are scalers, [a,b] is the vector
%                                if they are vectors (length=2), vector is from point a to point b  
%           textin           : the text to be put on the end (where b is); default is []
%           color            : the color input be passed to function 'myplot'
%           Lstyle, Pstyle: the style argument of the line and the point, will be passed to function 'myplot'
%  ----
%   string specified in 'textin' will be put "outside"
%   Useful in displaying PCA, NMDS results, and draw line on a graph.
%  ----
%   Example: myplot_vec(sin(1),cos(1)); axis( [-1 1 -1 1]); hline;vline
%                 myplot_vec([0, 1],[-2 3],[],2,':',3); axis( [-4 4 0 4]);
%                 myplot_vec(-0.2, -0.4, 'text',4,[],'d'); axis( [-1 1 -1 1]); hline;vline
%                 myplot_vec(0.5, 0.5,'vec1'); myplot_vec(-0.6,0.3,'vec2') ; myplot_vec(0.1,-0.3,'vec3'); axis( [-1 1 -1 1]); hline;vline
function [h1, h2] = myplot_vec(a, b,textin,color,Lstyle, Pstyle, font)
% setting default values
    if (nargin < 7), font = 12; end;
    if (nargin < 6||isempty(Pstyle)), Pstyle = []; end;
    if (nargin < 5 ||isempty(Lstyle)), Lstyle = 1; end;
    if (nargin < 4 || isempty(color)), color = 1; end;
    if (nargin < 3 ||isempty(textin)), textin = []; end;

% setting color for text
    if length(color)==1
        colorcode = mycolor(floor(color));
    else if length(color)==3
                colorcode = color;    
          else
                error('input [color] should be an interger (select from [mycolor]) or a 3-number color code')
          end
    end

% Default origin is [0, 0]
    if  isscalar(a) &&  isscalar(b)
        X = [0,a]; Y = [0,b];  
    else % otherwise, the vector can be originated anywhere
        X = [a(1), b(1)]; Y = [a(2) b(2)]; 
    end


% plot the line
    h1 = myplot(X,Y,'L',color,Lstyle); hold on
% plot the point
    if ~isempty(Pstyle)
            h2 = myplot(X(2),Y(2),'S',color,Pstyle);
    end
%% print the text
if all([X(2) >= X(1) ; Y(2) >= Y(1)]) % Q1
        if (Y(2)-Y(1))/(X(2)-X(1)) > 1 
                Z=2;
        else
                Z = 1;
        end
end
if all([X(2) < X(1) ; Y(2) > Y(1)]) % Q2
        if (Y(2)-Y(1))/(X(2)-X(1)) < -1
                Z = 2;
        else
                Z = 3;
        end
end
if all([X(2) <= X(1) ; Y(2) <= Y(1)]) % Q3
        if (Y(2)-Y(1))/(X(2)-X(1)) > 1 
                Z=6;
        else
                Z=5;
        end
end
if all([X(2) > X(1) ; Y(2) < Y(1)] ) % Q4
        if (Y(2)-Y(1))/(X(2)-X(1)) < -1 
                Z =6;
        else
                Z = 7;    
        end
end

%%
if ~isempty(textin)
         if Z==1 % Quadrant 1
             text(X(2),Y(2),textin, ...
                     'HorizontalAlignment','Left','VerticalAlignment','baseline',...
                      'FontSize',font,'Color',colorcode);
         end
          if Z==2 % 
             text(X(2),Y(2),textin, ...
                     'HorizontalAlignment','center','VerticalAlignment','baseline',...
                      'FontSize',font,'Color',colorcode);
          end
          if Z==3 % Quadrant 2
                text(X(2),Y(2),textin,...
                    'HorizontalAlignment','Right','VerticalAlignment','baseline',...
                    'FontSize',font,'Color',colorcode);
          end
           if Z==5 % Quadrant 3
               text(X(2),Y(2),textin,...
                   'HorizontalAlignment','Right','VerticalAlignment','cap',...
                   'FontSize',font,'Color',colorcode);       
           end
           if Z==6 % Quadrant 3
               text(X(2),Y(2),textin,...
                   'HorizontalAlignment','Center','VerticalAlignment','cap',...
                   'FontSize',font,'Color',colorcode);       
         end
         if Z==7
               text(X(2),Y(2),textin, ...
                       'HorizontalAlignment','Left','VerticalAlignment','cap', ...
                       'FontSize',font,'Color',colorcode);
         end
  end 