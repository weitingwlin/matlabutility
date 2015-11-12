%% 
% Function to transfer points in a symatric  matix to a line of data
% Wei-Ting Lin 2014/02/16
% e.g. in distance matrix
%  data =  0  1  2
%          1  0  3
%          2  3  0
%  line = [1 2 3]

function line= tri2line(data)

[N,P]=size(data);
line=zeros(N*(N-1)/2,1);
it=1;
for i = 1:N-1
    for j = i+1:N
        line(it)=data(i,j);
        it=it+1;
    end
end

    