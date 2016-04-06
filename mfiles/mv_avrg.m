%% mv_avrg: Moving average
% Function to calculate moving average
% syntext:
%           Vout= mv_avrg(Vin,frame)
%
% [Vin]: the input data, can be vector, length(Vin) = L, or matrix (n x p) 
% [frame]: the size of frame, 1 <= frame <= L, defult is 2
% [dim]: only used if input is matrix, 
%          note that default is 2 (more intuitive for time-series data)
% [Vout]: the moving avrage result, 
%               for vector input length(Vout) = (L-frame+1)
%               for matrix input, dim =1, size(Vout) = [n-1, p ]; dim = 2, size(Vout) = [n, p-1] 
%         
% Wei-Ting Lin 2013/10/30
% update 2015/10/21 : add default [frame]
% update 2015/11/06 : allow matrix as imput
% update 2016/02/20 : edit - input Vin can be either direction
function Vout= mv_avrg(Vin,frame, dim)
if (nargin<2) frame=2; end

[n , p] = size(Vin);
rotate = 0; % a flage to rotate the output vector
if n > 1 && p ==1
        Vin = permute(Vin, [2 1]);
        rotate = 1;
end

%%% Vector %%%
if isvector(Vin)
    L = length(Vin);
    Vout=Vin(1:(L-frame+1)); % so Vout has the same direction of Vin
                         % values will be replaced later 
    for i=1:(L-frame+1)
         Vout(i)=mean(Vin(i:i+frame-1));
    end
end 
%%% Matrix %%%
if ismatrix(Vin)
        [n, p] = size(Vin);
   if (nargin < 3), dim = 2; end     
     if dim==1 % moving average for each column
             Vout = zeros(n-1 , p);
             for i = 1:n-1
                   Vout(i,:) = mean(Vin(i:i+frame-1, :),1); 
             end
     else % dim = 2; moving average for each row 
             Vout = zeros(n, p-1);
             for j = 1:p-1
                   Vout(:, j) = mean(Vin(:, j:j+frame-1),2); 
             end
     end
end

%%%%%%%%%%%%%%%%
if rotate == 1
        Vout = permute(Vout, [2 1]);
end