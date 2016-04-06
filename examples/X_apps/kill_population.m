function survive = kill_population(old, kill , preference)
    n = length(old);
    
if nargin == 2
    temp = old(randperm(n));
    survive = temp(kill+1 : end); 
end

if nargin == 3
    survive = old;
    for k = 1 : kill % kill one at a time
        ns = n-k+1; % number of surviver
        W = zeros(1, ns);
             W(survive == 2) = preference(1); % homozygot
             W(survive == 1) = preference(2);
             W(survive == 0) = preference(3);
        temp = mylottery(1:ns, W); % index of the killed one
        survive = survive([1 : temp - 1, temp + 1 : end]);       
    end   
end