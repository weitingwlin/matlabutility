%

function pid= checkerboard(X, Y, outputtype)
    if (nargin <3), outputtype = 'M';end
    if (nargin < 2), Y=X; end;
    
        pid=zeros(X,Y);
for i=1:X
    for  j=1:Y
         if mod(i+j,2)==0
             pid(i,j)=1;
         end
    end
end

% output in a linear form
if outputtype =='L'
    pid = pid(:);
end