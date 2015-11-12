% LMS regression
% MODEL:
%     Y=b0+b1*X ;   find out the robust regression 
% find by  2 rounds: 1st: alpha=0~pi, find best alpha--> a_fit
%                          m2(a_fit) is minimized
%                    2nd: alpha= a_fit-pi/40~a_fit+pi/40
%
% (2009/11/24  Lin, Wei-Ting)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SYNTAX : Bs=reg_lms2(X, Y ,step,Nt)    %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bs:   [b0; b1]
%       where  Y=b0+b1*X
% data: [X,Y] ; N X 2 matrix for N data points
% step: decide the steps used in each of the two rounds
%    
% re-noting and improve 2014/09/10
function Bs=reg_lms2(X, Y,step)
N = length(X);
D=[ones(N,1),X,Y];
data=[X,Y];
% [1 xi yi]: 3 X N matrix or convinience
%% 1st round
alpha=[1/step:1/step:1].*(pi/2); 
% The spectrum of the arc in 1st trial
b1=tan(alpha);
% slope (correspondent b1s)

% find min(m2) for each b1
for i=1:length(b1)
       ind=data*[-b1(i);1]; % index for a proper range of b0, for each b1 
                            % (intercept(==b0) when line with certain b1 fitted to each point)
                            % Yn = b1(i) * Xn + b0; b0 = Yn - b1(1) * Xn 
b0s=[min(ind):range(ind)/step:max(ind)];
                           % try b0s within the range of [ind]
  r2 = ( D * [(-1)*b0s ; repmat([-b1(i);1] ,1,length(b0s))] ).^2;
                           % N * step, r2 =  (y-b1x-b0)^2             
                           % each column for each b0
m2(i)=min(median(r2)); % .record [m2] for each b1     
end
% find out a_fit by minimize m2
a_fit = round(median( find(m2==min(m2)) ));% a_fit is the index for the alpha value that gives the best fit
        % in case there are more than one  
%
%% 2nd round
alpha2=[alpha(a_fit)-pi/40: pi/20/step:alpha(a_fit)+pi/40];
% 2014/09/10: also (step) alpha values to be tested insted of 5*(step)
% a new, smaller range of alpha: a_fit(+/-)pi/40
% the range is not affected by step.
b12=tan(alpha2);
% new b1s corresponding to alpha2

for i=1:length(b12)
       ind=data*[-b12(i);1]; % index for a proper range of b0, for each b1       
b0s = [min(ind):range(ind)/(step*10):max(ind)];
          % step lemgth in the 2nd round is finer: step*10
  r2 = (D * [(-1)*b0s ; repmat([-b12(i);1] ,1 , length(b0s))] ) .^ 2;
                          % N * (step*10), r2 =  (y-b1x-b0)^2             
                          % each column for each b0
  good_b0=b0s(find(median(r2) == min(median(r2))));
          % sometimes there are more than one
m22(i,:)=[min(median(r2)),median(good_b0)];
                         %^^^^^^^^^^^^^^^^
           %              when there are more than one good_b0  
           % In case like this b0s are probably not too good at all, so,   
           %  this is a convenient step...
   % each row: [m2, correspondent b0]
end
fit=round( median ( find(m22(:,1) == min(m22(:,1))) ) ); % index for min(m2)
Bs=[m22(fit,2) ; b12(fit)];% [b0,b1]
