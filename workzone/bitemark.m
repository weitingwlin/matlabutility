function Z = bitemark(X,Y,it)

if (nargin < 3), it = 1000; end;

Zcand = [Y:X*2];

freqs= zeros(length(Zcand),1);

for k = Y:X+1
    temp = zeros(it,1);
    for i=1:it
    temp(i)=length(unique(randi(X,1,k)));
    end
freqs(k) = sum(temp==Y);
end

Z=median(find(freqs==max(freqs)));

