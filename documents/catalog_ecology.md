# Ecology data analysis and modeling

Functions used in ecological data analysis and modeling. e.g. community analysis, biodiversity calculation.

* **aggregation.m** : Indices for inter- and intra-species aggregation.(ref. Sevenster, 1996) 
* **association\_ind.m** : calculate association index
* **association\_ind\_bstr.m** :  calculate association index and bootstrap analysis
* **association\_ind\_bstr\_par.m** :  calculate association index and bootstrap analysis, accelerate using **parfor**
* **colonization.m** : calculate colonization rate from time series data.
* **beta_NES.m** : beta-diversity of different kind 
* **bio_diversity.m** : calculate biodiversity indices
* **bitemark.m** : transform bite mark count to estimated number of bite (where multiple bite cannot be distinguished).
* **bray_curtis.m** : 
* **checkerboard.m** : creating checkerboard landscape
* **disp_incidence.m** : simulate dispersal events (ref. Hanski & Woiwod, 1993)
* **explore_ttest.m** : transform data and do t-test
* **fisher_alpha.m** : Fisher's alpha, the diversity index
* **null_betaNES.m** : null model simulation for betaNES
* **numInteraction.m** : Calculate numeric interaction from time series data of two populations.
* **numInteraction_bootstrap.m** : calculate CI and median for null model of the result in **numInteraction.m** using bootstrap.
* **plotTaylorFit.m** : function to fit Taylor's power law, and make plot.
* **TaylorFit.m** : function to fit Taylor's power law in community data.
* **work_bitemark.m** : Working and demo of function **bitemark**. 