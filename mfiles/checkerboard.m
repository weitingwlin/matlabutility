function pid= checkerboard(X, Y)
if (nargin < 2), Y=X; end;

    pid=zeros(X,Y);


for i=1:X
    for  j=1:Y
         if mod(i+j,2)==0
             pid(i,j)=1;
         end
    end
end