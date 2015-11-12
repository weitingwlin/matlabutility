%% Generalized logistic Function
% used in smooth a threshold function
% ref. the wiki page
% https://en.wikipedia.org/wiki/Generalised_logistic_function

X = [0:150];

% parameters 
A = 0; % the lower asymptote;
K = 0.05;  % the upper asymptote. If A=0 then K is called the carrying capacity;
B = 2; 
M=100;
Y = A+(K-A)./(1+exp(-1*B*(X-M)));
%% aphid
figure 
for b = 1:5
        Bsim=1/(b*2);
Y = A+(K-A)./(1+exp(-1*Bsim*(X-M)));
myplot(X,Y,'L',b);hold on
end

%% ladybug
A = 0.9;
K = 0.3;
M=15;
figure 
Bsim=[1 0.5 0.25 0.1 ];
for b = 1:4
Y = A+(K-A)./(1+exp(-1*Bsim(b)*(X-M)));
myplot(X,Y,'L',b);hold on
end
