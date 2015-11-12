%% Function to calculate Eclidean distance 
% syntext: 
%        Dist_met = Euclidean_D (data)
% [data]: input n * p matrix of n point, p dimentional data
% [Dist_met]: output n * n distance matrix, Dist_met(i,j) is the
%             Euclidian distance between point i and j
function Dist_met=Euclidean_D(data)
[N, P]=size(data);% N points of P-dimensional data
Dist_met=zeros(N,N);% prepared data sheet

for i=1:N-1
    for j=i+1:N
    diffs=(data(i,:)-data(j,:)); % pairwise distance of each variable/coordinate
    temp=sqrt(sum(diffs.^2,2)); % squareroot of "sum of square" 
        Dist_met(i,j)=temp;
        Dist_met(j,i)=temp;
    end
end