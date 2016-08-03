%% Example: how to use function [mysubplot]
% This is an DEMO for my function *[my_subplot]*.
%
% Depends on [myplot] [mycolor]
%
% *Wei-Ting Lin* _2015/9/21_
% 
% _This file is formatted to be published using matlab._
%% [mysubplot]: Create subplots with Major title
% Usage:

%% Making mock data
    X = [1:10];
    Y = [1:10]+rand(10,1)'*20';
%% Examples:
% This and later examples here use [myplot], a function makes pretty plots more quickly, and [mycolor], select color
% more easily.
%
% If the labels overlap, manually adjust the size of figure window would likely solve the problem.
    figure
    % making major title
        mysubplot(1,2,0,'Big title')
    % making subplots
        mysubplot(1,2,1)
            plot(X,Y,':')
            xlabel('X');ylabel('Y ')
            title('small Title A')
        mysubplot(1,2,2)
            plot(X,Y,'o')
            xlabel('X');ylabel('Y')
            title('small Title B')
%% Another example
   figure
   mysubplot(4,4,0, 'Major title')
for i = 1:16
    mysubplot(4,4,i)
    myplot(X,Y, 'S', i);
end
%% Shrink padding size 
   figure
   mysubplot(4,4,0, 'Major title')
for i = 1:16
    mysubplot(4,4,i, [], 0.1, 0.1)
    myplot(X,Y, 'S', i);
    set(gca,'xtick',[])
    set(gca,'ytick',[])
end
%% Example of merging cells

    figure
    % making major title 
        mysubplot(3,3,0,'Big title')
    % making subplots
        mysubplot(3,3,1)
            myplot(X,Y,'L')
            xlabel('X');ylabel('Y ')
            title('small Title A')
    % making subplots of different sizes by merging cells 
        mysubplot(3,3,[6 9])
            myplot(X,Y,'S')
            xlabel('X');ylabel('Y')
            title('small Title B')
        mysubplot(3,3,[4 5 7 8])
            myplot(X,Y,'S',15)
            xlabel('X');ylabel('Y')
            title('small Title C')
%% Error about merging cells
% if assigned subplot cells does not make a square, error occur
        mysubplot(2,2,[2 3])
%% To display  Cell layout
       mysubplot(3,3)
