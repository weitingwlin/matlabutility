% Fit Taylor's power law to data
%
% SYNTAX:
%             [fitresult, gof] = TaylorFit(Mat)
%
%             Mat : n x p, population of patch 1~n in time 1~p, each row is
%             a time-series for a patch, each column is a snapshot of the
%             community
%
function [fitresult, gof] = TaylorFit(Mat)
M = nanmean(Mat(any(Mat > 0, 2),:)');
V = nanvar(Mat(any(Mat > 0, 2),:)');
 
%% Fit: 'Taylor's power law'.
[xData, yData] = prepareCurveData( M, V );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [3.4418170276419 1.82634562202746];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );