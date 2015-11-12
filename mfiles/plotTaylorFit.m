% Fit Taylor's power law to data amd  make plot
%
% SYNTAX:
%             [fitresult, gof] = TaylorFit(Mat)
%
%             Mat : n x p, population of patch 1~n in time 1~p, each row is
%             a time-series for a patch, each column is a snapshot of the
%             community
%
function h= plotTaylorFit(Mat)
M = nanmean(Mat(any(Mat > 0, 2),:)');
V = nanvar(Mat(any(Mat > 0, 2),:)');


%% Fit: 'Taylor's power law': this part is the same as TaylorFit.m
[xData, yData] = prepareCurveData( M, V );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [3.4418170276419 1.82634562202746];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

%% Plot fit with data.
figure;
myplot( xData, yData,'S',28 ); hold on
        Xlim=xlim;
        Xsim = linspace(Xlim(1),Xlim(2),100);
        Ysim = fitresult.a .* Xsim .^fitresult.b ;
myplot(Xsim, Ysim,'L',14 ); hold on
  set(gca,'FontSize',14,'linewidth',2);
legend(  'Data', 'Taylor power law');
title({ ['a =' num2str(fitresult.a)], [ 'b =' num2str(fitresult.b)]})
% Label axes
xlabel( 'Population Mean' );
ylabel( 'Population Varience' );

