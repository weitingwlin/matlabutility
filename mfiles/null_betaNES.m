% data :  each raw is a sample, each column is a species
% itt: itteration of null data
%
% null data was created by shuffling each column, so species association will be broken. 
% Depends on: betaNES
%
% ref. Baselga, 2010
function out = null_betaNES(data , itt)

    if nargin ==1
            itt = 1000;
    end
%% data point
    betas = betaNES(data); 
%% sheet
    nullsor = zeros(itt,1);
    nullsim = zeros(itt,1);
    nullnes = zeros(itt,1);
    nulleuc = zeros(itt,1);
    nullvaralpha = zeros(itt,1);
%% simulation
    for i = 1 : itt
        mock =shuffler(data, 1); % mess up the sample ID of local populations
        bs = betaNES( mock );
        nullvaralpha(i) = std(sum((mock>0), 2))/mean(sum((mock>0), 2));
        nullsor(i) = bs.sor;
        nullsim(i) = bs.sim;
        nullnes(i) = bs.nes;
        nulleuc(i) = bs.euc;
    end
%% med and CI; in structure
    out.sor.data = betas.sor;
    out.sor.ci = quantile(nullsor,[0.025 0.975],1); % get 95%, 2-tail confidence interval for each column in TDsh
    out.sor.med = median(nullsor);
    out.sor.SES = (betas.sor-mean(nullsor))/std(nullsor);
    out.sor.sig = (betas.sor < out.sor.ci(1,:))|( betas.sor > out.sor.ci(2,:) ) ;
    
    out.sim.data = betas.sim;
    out.sim.ci = quantile(nullsim,[0.025 0.975],1); % get 95%, 2-tail confidence interval for each column in TDsh
    out.sim.med = median(nullsim);
    out.sim.SES = (betas.sim-mean(nullsim))/std(nullsim);
   out.sim.sig = (betas.sim < out.sim.ci(1,:))|( betas.sim > out.sim.ci(2,:) ) ;
    
    out.nes.data = betas.nes;
    out.nes.ci = quantile(nullnes,[0.025 0.975],1); % get 95%, 2-tail confidence interval for each column in TDsh
    out.nes.med = median(nullnes);
    out.nes.SES = (betas.nes-mean(nullnes))/std(nullnes);
    out.nes.sig = (betas.nes < out.nes.ci(1,:))|( betas.nes > out.nes.ci(2,:) ) ;
 
    out.euc.data = betas.euc;
    out.euc.ci = quantile(nulleuc,[0.025 0.975],1); % get 95%, 2-tail confidence interval for each column in TDsh
    out.euc.med = median(nulleuc);
    out.euc.SES = (betas.euc-mean(nulleuc))/std(nulleuc);
    out.euc.sig = (betas.euc < out.euc.ci(1,:))|( betas.euc > out.euc.ci(2,:) ) ;
    
    out.varalpha.data = std(sum((data>0), 2))/mean(sum((data>0), 2));
    out.varalpha.ci = quantile(nullvaralpha,[0.025 0.975],1); 
    out.varalpha.med = median(nullvaralpha);
    out.varalpha.SES = (out.varalpha.data - mean(nullvaralpha))/std(nullvaralpha);
    out.varalpha.sig = (out.varalpha.data < out.varalpha.ci(1,:))|( out.varalpha.data > out.varalpha.ci(2,:) ) ;
      
      