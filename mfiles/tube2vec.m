% functions transfer a "Tube" or "Tunnel" into a simple vector
% a "tube" is a 3rd dimention values in a 3D matrix, e.g. A(1,1,:)
% Wei-Ting Lin 2013/10/07
%  

warning('better use built in function "permute"') 
function Vnew = tube2vec(Vold)
    N=length(Vold);
    Vnew=zeros(N,1);
for i=1:N
    Vnew(i)=Vold(i);
end