% return distance metrics for a single Vector
% data:
% Dist_met:
function Dist_met=Distance(data)
[N, P]=size(data);
Dist_met=zeros(N,N);

for i=1:N-1
    for j=i+1:N
    temp=abs(data(i)-data(j));
        Dist_met(i,j)=temp;
        Dist_met(j,i)=temp;
    end
end