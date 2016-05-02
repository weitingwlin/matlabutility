%% Demo of the function fisher_alpha.m

%% Demonstrating how the Newton's method work 
 % set up parameters
        S = 10;
        N = 20;
        X = 0.5; % the first estimation
% plot out the function f(x) to x
                Xs = [0.01: 0.01: 0.99];
                fXs = (Xs-1)./Xs .* log(1-Xs)  -S/N;
        myplot(Xs, fXs, 'L'); hold on
                hline(0, 1);
 % calculate f(X) and the tangent of f(X) at the first estimate 
                fX = (X-1)./X .* log(1-X)  -S/N;
                dfX = log(1-X) ./ (X.^2) + (1/X);
        myplot(X, 0,'S',2); text(X, 0-0.1,'X_1')
        myplot(X, fX, 'S',2 ); text(X, fX-0.06, 'f(X_1)')
 % plot the tangent       
                Xs2 = [0.01 0.5 0.99];
                tang = (Xs2-X)*dfX + fX; 
        myplot(Xs2, tang,'L', 7);      
        Xt = X - fX/dfX; 
        myplot(Xt, 0, 'S',2 ); text(Xt, 0-0.1, 'X_2')
 % labels
        xlabel('X'); ylabel('f(X)')
        title('Newton`s method')
%% Test the function
fisher_alpha(10,5)
%%
fisher_alpha(20,10)
%%
fisher_alpha(20,5)