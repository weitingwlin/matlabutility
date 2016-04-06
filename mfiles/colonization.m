%% Calculate colonization rate from population matrix
% 
% SYNTAX:
%               [colevent, detail] = colonization(Mat)
%            
%                Mat  :  population matrix (n x p), population of patch 1~n in time 1~p.
function [colevent, detail] = colonization(Mat)

[n, p] = size(Mat); 
paMat = Mat> 0; % presence
emptyPatch = Mat == 0; % absence
coleventTS = sum(diff(paMat,1,2)==1); % total colonization event
coleventMap =  sum(diff(paMat,1,2)==1,2);
colevent = sum(coleventMap);

detail=[];
    popTS = sum(Mat); % number of total indiviaul count
    colTS = sum(paMat);% number of total colony (= local population) count
detail.perCapitaTS = coleventTS./popTS(1 : end-1);  %
detail.perCapitaAdjTS = coleventTS./popTS(1 : end-1)./sum(emptyPatch(:, 1 : end-1))*n; %  ~colonization ability 
detail.perPatchTS = coleventTS./sum(emptyPatch(:, 1 : end-1));  % colonization rate per empty patch; effective colonization
detail.TS = coleventTS;
detail.Map = coleventMap;





