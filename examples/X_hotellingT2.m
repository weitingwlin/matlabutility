% Learning, testing, and trying to make my own function

%% Test this function using amother dataset
% women's nutrient data: 
% https://onlinecourses.science.psu.edu/stat505/node/105
%
% Load data
                 
        nutrient = subset( load([datapath 'nutrient.txt']), [] ,'2:end');   % remove the ID column
        % variable names 
        fileID = fopen([datapath 'nutrientNames.txt']);
                temp = textscan(fileID,'%s');
                nutrientNames = temp{1}'; % variable names for each column stored in  [Data]
        fclose(fileID); 
        mu0 = [1000 15 60 800 75];
 % explore data
       [n, p] = size(nutrient);
        M = mean(nutrient);
        S = cov(nutrient);
 % T2 :n(D¡Â ? £_)¡¬S?1 d (D¡Â ? £_)
        T2 = n*(M-mu0)*inv(S)*(M-mu0)'
        Fstat = (n-p)*T2 /p/(n-1);
%% test my function

        [h, p, stat] = hotellingT2(nutrient, mu0);