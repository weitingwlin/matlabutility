function Vout= mv_diff(Vin, frame, dim)
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
    for i = 1: (L - frame + 1)
         Vout(i)=Vin( i + frame - 1 ) - Vin( i ) ;
    end
end 
%%% Matrix %%%
if ismatrix(Vin)
        [n, p] = size(Vin);
   if (nargin < 3), dim = 2; end     
     if dim == 1 % moving average for each column
             Vout = zeros(n -frame + 1 , p);
             for i = 1 : n -frame + 1
                   Vout( i, : ) = Vin(i+frame-1, :) -  Vin(i, :); 
             end
     else % dim = 2; moving average for each row 
             Vout = zeros(n, p - frame + 1);
             for j = 1:p - frame + 1
                   Vout(:, j) = Vin(:, j+frame-1) -  Vin(:, j); 
             end
     end
end

%%%%%%%%%%%%%%%%
if rotate == 1
        Vout = permute(Vout, [2 1]);
end