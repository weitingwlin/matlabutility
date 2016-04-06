%% Function to transfer data and pass through a ttest
%  This function should also serve as a primer  of doing t-test with matlab
% , with the output explained (here), and option of showing histogram
%  
% SYNTAX:
%               [h, detail] = explore_ttest( X, M, transform, parameter)
%               [h, detail] = explore_ttest( X, transform, parameter)
%
%  X: data
%  M: the null hypothesis of mean; default is zero
%  transform : 
%                 * 'log' : default parameter is 1, log(X+1)
%                 * 'arcsinsqrt':
%                 * 'arcsin' : 
%                 * 'sqrt'
% 
%  h : whether the null hypothesis rejected, a yes or no answer;
%       based on standard parametric test: t-test
%        h = 0 means accept the null hypothesis mean = 0
%        h = 1 means reject
%  detail :  noramlity test of original and transformed data 
%         .p_value : p value from t-test
%         .p_ks : p value of Kolmogorov-Smirnov test for normality
%         .p_original : p value from t-test on original (not transformed data)
%         .p_ks_original : 
%         .p_method : transformation method
function [h, detail] = explore_ttest( X, M, transform, parameter)
%%f%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Default
    if nargin == 1 %  explore_ttest(X)
        M = 0;
        transform = 'no';
        parameter = [];
    end
    if isstr(M) % explore_ttest(X, transform,...)
            if nargin ==3    %  explore_ttest(X, transform,parameter)
                    parameter = transform;
            else
                    parameter = [];
            end
            transform = M; %                  
            M = 0; % default
    else % explore_ttest(X, M, ...) ; pass the default values
           if nargin <=3 % explore_ttest(X, M) or explore_ttest(X, M, transform) ; 
                    parameter = [];
           end
           if nargin <= 2 % explore_ttest(X, M) 
               transform = 'no';
           end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

% The original data
       % Test for normality 
       [hks, pks] = kstest(zscore( X ));
            %  histogram(asin(PI_HH),10)        
       [ht, pt]= ttest(X,M);
       
           if any(strcmp(transform,{'no', 'null','normal'}))
                    h = ht;
                    detail.p_ks = pks;
                    detail.p_value= pt;
                    if hks == 1
                        warning('normality not reached, try other method or transformation')
                    end 
           else
%%%%% Transformation 
            if any(strcmp(transform,{'arcsinsqrt','asinsqrt','arcsinesqrt', 'arcsine square root'}))
            % arcsin of sqrt of the original data
                    X1 = asin(sqrt(X)); % the transformed data
                    M1 = asin(sqrt(M)); % the transformed mid point
                    method = 'arcsine square root' ;
            end
            if any(strcmp(transform,{'arcsin', 'asin'}))
                    X1 = asin(X); % the transformed data  
                    M1 = asin(M);
                    method = 'arcsine' ;
            end
            if any(strcmp(transform,{'sqrt', 'squareroot', 'square root'}))
                    X1 = sqrt(X); % the transformed data  
                    M1 = sqrt(M);
                    method = 'square root';
                    
            end
            
            if any(strcmp(transform,{ 'log'}))
                  if isempty(parameter)
                      parameter = 1; % the default parameter 
                  end
                   X1 = log(X + parameter);
                   M1 = log(M + parameter);
                   method =['log( X + ' num2str(parameter) ' )'];
            end
%%%%%%%%%%%%%%            
            % KS test for normality
                    [h1ks, p1ks] = kstest(zscore( X1 ));  % test for normality                   
            % t-test on transformed data
                    [h1t, h1p] = ttest(X1,M1);         
            % output
                    h = h1t;
                    detail.p_ks = p1ks;
                    detail.p_value = h1p;
                    detail.p_ks_original = pks;
                    detail.p_value_original = pt;
                    detail.method = method;
                    detail.M_transformed = M1;
                    if h1ks == 1
                        warning('normality not reached, try other method or other transformation')
                    end       
           end
          

  
    