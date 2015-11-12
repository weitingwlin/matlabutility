%% 
% Function to transfer points in a line of data to a symatric  matix
% * the oppsite of tri2line 
% e.g. A = tri2line(line2tri(A))
%      B = line2tri(tri2line(B))
% Wei-Ting Lin 2014/9/7
% e.g. in distance matrix
% 
%  data = [1 2 3]
%  mat  =  0  1  2
%          1  0  3
%          2  3  0

function mat = line2tri(data)
L = length(data);
N = (1+sqrt(1 + 8*L ))/2; % because L = N(N-1)/2
mat=zeros(N,N);
it=1;

for i = 1:N-1
    for j = i+1:N
        mat(i,j) = data(it);
        mat(j,i) = data(it);
        it=it+1;
    end
end

    