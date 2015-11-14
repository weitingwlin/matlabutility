% example for calculating association index
cd 'C:\Users\ASUS\Dropbox\DataCoding\utility_wtl\examples'
load ./X_data/X_community
%%
A = association_ind(insect_data);
%%
tic
[L11,L12]=association_ind_bstr(insect_data)
toc
%%
tic
[L21,L22,mid2]=association_ind_bstr2(insect_data)
toc
%% plot out the result
figure
subplot(2,1,1)
    box_lim = [L11(2:5); L12(2:5)];   % 2*X  data, CI for X sets 
     box_mid = [0 0 0 0];     % vector of X values, median
     points = A(2:5);       % vector of X values, data point of interest
 
     tx_title = ('Association Index (1)'); % text for title
     tx_y = ('Ind.');                    % text for y label
     yframe = ([-0.1 1.1]);         % set y limit
     ymark = [0 0.25 0.5 0.75 1];            % set where you want y ticks    
     script_plot_ci_style
subplot(2,1,2)
box_mid = mid2(2:5); 
    box_lim = [L21(2:5); L22(2:5)];   % 2*X  data, CI for X sets 
     tx_title = ('Association Index (2)'); % text for title
     script_plot_ci_style
     