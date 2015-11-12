clear;clc
load carsmall % Example data 
%%
tbl=table(MPG,Weight,Model_Year)
M1=fitlm(tbl,'MPG ~ Weight + Model_Year + Weight:Model_Year')
myplot(Weight,MPG,'S')
 M1.ModelCriterion.AIC