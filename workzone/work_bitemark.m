% Working and demo of function bitemark_2

cd 'C:\Users\ASUS\Desktop\Weiting Brain_brain\Files\A0726228-D978-A3FD-0CA1-4C69031CD80C'
%% Example
Ytest = [ 70 80 90 95];
for y = 1:4
tic
Z(y) = bitemark_2(100, Ytest(y), 100, 2*Ytest(y),  5);
toc
end
% Z=[105   139   175   189]
Z100=Z
%%
save Egbite Z Z100
%% Example: will take a while
Ytest2 = [190];
tic
for y = 1:length(Ytest2)
tic
[Z, Zfreq, Zcand] = bitemark_2(200, Ytest2(y), 100, 2*Ytest2(y),  5);
toc
end
toc
%% Z=[105 
myplot(Ytest,Z,'S')
myplot(Ytest(1:end-1),diff(Z),'S'); hold on
myplot(Ytest(1:end-1),diff(Z),'L',28)
%%
