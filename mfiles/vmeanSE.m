% print mean and SE of a vector
function [ msg, strout] = vmeanSE(vin)

n = sum(~isnan(vin));
m = nanmean(vin);
SE = nanstd(vin)/sqrt(n);

strout.m = m;
strout.SE = SE;
strout.n = n;
strout.shortmsg = [ num2str(m, 3) ' (SE : ' num2str(SE, 3) ')'];
msg = ['mean : ' num2str(m, 3) '; SE : ' num2str(SE, 3) '; n = ' num2str(n, 3)]; 
