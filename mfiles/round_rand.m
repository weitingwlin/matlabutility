% round up randomly
function N_new = round_rand (N_old)
% N_old can be number, vector or matrix 

[N,P] = size(N_old);
N_new = zeros(N,P);
for i=1:N
for j=1:P
    A = floor(N_old(i,j)); % the round part
    B = rand < (N_old(i,j)-A);
    N_new(i,j) = A + B;
end
end