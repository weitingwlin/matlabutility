%% Hotelling's T-Squared test for one multivariate sample. 
%  also used in pairwised two sample multivariate t-test
%
% ref: Matlab file exchange: HotellingT2 by Antonio Trujillo-Ortiz
%               url:  http://www.mathworks.com/matlabcentral/fileexchange/2844-hotellingt2
%        Pennsylvania State University, STAT 505 website
%               url:  https://onlinecourses.science.psu.edu/stat505/
%
% SYNTAX:
%                [h, pval, stat] = hotellingT2(X, mu0, alpha)
% 
%       Input--
%                X:        data, n*p, with n replicates and p variables
%                mu0:    null hypothesis of mean
%                alpha:   alpha threshhold, default is 0.05
%       Output--
%                h :        hypothesis testing results, 0 - accept, 1 - reject null hypothesis
%                pval :    p value
%                stat:     structure, contains 
%                            T2 - T-square value
%                            F - F statistics for the T-square
%                            df1, df2 - digree of freedom
%
% Created: 2016/02/03

function [h, pval, stat] = hotellingT2(X, mu0, alpha)
        X = X(:,any(X));
        [n, p] = size(X);

if (nargin < 3), alpha = 0.05; end 
if (nargin < 2 || isempty(mu0)), mu0 = zeros(1,p); end 


        M = mean(X);
        S = cov(X);
 % Hotelling's T-square
        T2 = n*(M-mu0)*inv(S)*(M-mu0)'
 % F value     
        Fstat = (n-p)*T2 /p/(n-1);
 % P value
        pval = 1-fcdf(Fstat, p, n-p);
 % result of hypothesis testing
        h = 0;
        if pval < alpha
                h = 1;
        end
 %%% more output in the structure "stat"
        stat.T2 = T2;
        stat.F = Fstat;
        stat.df1 = p;
        stat.df2 = n-p;