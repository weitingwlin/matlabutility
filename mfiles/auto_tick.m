%% calculate proper possition of Y ticks
%  *Syntax*
%
%   [tickmark] = auto_tick (f1,f2,Nt)
%
%   * [tickmark]:  a vector, values where you want tick marks; be 1,2,or 5 x 10^N (N is interger). 
%   * f1,f2:       max. and min. of data value
%   * Nt:          approximate number of Y ticks you want 
% 
function [tickmark] = auto_tick (f1,f2,Nt)
%% swap if f1 <  f2
% this step make sure f1 is the upper limit
if nargin < 3
    Nt = 4;
end
if f1<f2
    temp=f1;    f1=f2;    f2=temp;
end
%% Find best tick interval
% Two steps to calculate tick interval 
% 
% * Rough: Estimate interval S as 10^N, N is interger
% * Fine:  Test some candidate tick intervals for 10 times smaller or
% bigger. Candidate interval can be 1,2,or 5 of 10^N. 

f_L = f1-f2;                   % range of values
S =  (10^ceil(log10(f_L/Nt))); % a rough estimation 
testS=[S/10  S/10*2  S/10*5  S   S*2  S*5  10*S]; % candidate t_L; 
%%
% Calculate numebr of ticks needed for each candidate (SS)
SS = zeros(1,7); % empty sheet 
for t=1:7    
  t_1 = floor(f2/testS(t)); % the lowest tick
  t_2 = ceil(f1/testS(t)); % the highest tick
SS(t) = 1 + (t_2-t_1);% number of tickss for candidate t
end
%%
% Find the tick interval that create number of ticks closest to the
% assigned number, Nt
Ind = find(abs(SS-Nt) == min(abs(SS-Nt)));
t_L=testS(Ind(1));
%% Position of tick marks, a vector, as out put
    t_1 = floor(f2/t_L);
    t_2 = ceil(f1/t_L);
tickmark=t_L*[t_1:t_2];