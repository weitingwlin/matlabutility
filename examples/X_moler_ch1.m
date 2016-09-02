%% 1.1 The golden ratio

    phi = (1 + sqrt(5))/2
    format long
    phi
%%    
% A polynomial function
    p = [1 -1 -1];
    r = roots(p)

% Symbolic solution
    syms x
    r = solve(1/x == x-1)
    phi =r(2) 
    % now phi is a symbolic expression
% Convert symbolic expression to numeric
    %  variable-precision arithmetic 
        vpa(phi, 50)  
    %  double-precision floating point
        phi = double(phi)
%% Define an anonymous function
    % f(x) = 1/x - (x-1)
       f = @(x) 1./x-(x-1)
       
% Plot a function
    ezplot(f, 0, 4)
    
    % the function ezplot automatically picks reasonable scales
% look for solution     
    phi = fzero(f,1) % look for zeros near x = 1
 
% Plot golden ratio
    goldrect

%% Continued fraction
% use function goldfract(n)
 goldfract(6)
 
 %% 1.2 Fibonacci Numbers
 % f1 = 1
 % f2 = 2
 % fn = fn-1 + fn-2
    fibonacci(12)
    
 %% tic toc
 tic, fibnum(24), toc
  tic, fibnum(35), toc
%% Fibonacci v.s. golden ratio
    n = 40;
    f = fibonacci(n);
    format long
    f(2:n) ./ f(1:n-1)
%%
f(2:n) ./ f(1:n-1) - phi

%% Fractal Fern
finitefern(2100)
%% image
F = imread('fern.png');
image(F)

%% 1.4 magic square
A = magic(3)

    sum(A) % equal to sum(A,1)
    sum(A,2)
        diag(A)
    sum(diag(A))
    
     rot90(A) % "rotate 90 degress"
%% linear algebra
det(A)
format short
inv(A)

format rat % rational format
inv(A)
format short % restore

r = norm(A)
e = eig(A)
s = svd(A)  
%% symbolic leaner algebra
B=sym(A)

sum(B)
sum(B,2)
det(B) 
inv(B)
eig(B)
svd(B)

%% 
clear; clc
load durer
whos

%%
image(X)
colormap(map)
axis image

%%
load detail
image(X)
colormap(map)
axis image
%%
% some matrix cannot have inv()
% if rank <n
for n = 1:24, r(n) = rank(magic(n)); end
[(1:24)' r']