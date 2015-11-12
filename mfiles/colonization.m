%% Calculate colonization rate from population matrix
% 
% SYNTAX:
%               [colevent, detail] = colonization(Mat)
%            
%                Mat  :  population matrix, population of patch 1~n in time 1~p.
function [colevent, detail] = colonization(Mat)

paMat = Mat> 0; % presence

coleventTS = sum(diff(paMat,1,2)==1); % total colonization event
coleventMap =  sum(diff(paMat,1,2)==1,2);
colevent = sum(coleventMap);

detail=[];
    pop = sum(Mat(:)); % number of total indiviaul count
    col = sum(paMat(:));% number of total colony (= local population) count
detail.perCapita = colevent/pop;  
detail.perColony = colevent/col;  
detail.TS = coleventTS;
detail.Map = coleventMap;





