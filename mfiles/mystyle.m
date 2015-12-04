%% Style selector
% 
% STYNTAX:
%                out = mystyle(stylecode, type)
%           
%                stylecode  : numeric, 
%                type         : 'S' or 'L' for scatterplot and line, respectively.
function out = mystyle(stylecode, type)

if (nargin < 2), type = 'S'; end;
if (nargin < 1), stylecode = 0; end;
if ischar(stylecode) 
        type = stylecode;
        stylecode = 0;
end

% Return style  for stylecode ~= 0
if stylecode~=0
        if type=='L'
                stylesheet = {'-','--',':','-.' }; % Set stylesheet base on type. 
                out = stylesheet{stylecode};    
        else
                if type =='S'
                stylesheet = {'o', 's','d','^','p','+','*','X','v','>','<','.'};
                out = stylesheet{stylecode};    
                else
                error('type should be `S` or `L`');
                end
        end
end

% Plot styles
if stylecode==0
        figure
        if type =='L'
                for i = 1:4
                        myplot([0 i],[0 1], 'L',1,i); hold on
                        text( i-0.5, 1-0.1,num2str(i))
                        axis([0 4 0 1])
                end
        end
        if type == 'S'
                for i = 1:10
                myplot(i, 1, 'S', 1,i); hold on
                text(i,1.2,num2str(i))
                axis([0 10.1 0 2])
                end
        end
end


 


