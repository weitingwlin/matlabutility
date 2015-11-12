% My plot function to make "pcolor plot with only boundary lines"
%
% example
% clear; clc
% m=zeros(10)
% m([2:5 3 13 14 41 42 51 52 54 61 62 65 66 71 72 76 77 81 82 86 87 91 92 96 97])=1
% m([53 63 64 73 74 83 84 93 94])=2
% m([75 85 95])=3
% M=line_contour_lin(m)

%% 
function ok=line_contour_lin(M)
[n, p]=size(M);
% Verticle lines
for i=1:n
    for j=1:(n-1)
        A=M(i,j);
        if M(i,j+1)~=A
            plot([j+1,j+1],[i,i+1],'-b'); hold on
        end
    end
end

% Horizontal lines
for j=1:n
    for i=1:(n-1)
        A=M(i,j);
        if M(i+1,j)~=A
            plot([j,j+1],[i+1,i+1],'-b'); hold on
        end
    end
end
ok=[n p];
axis([1 n+1 1 n+1])
