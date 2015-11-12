# Matlab utility codes

This is a colection of matlab functions and examples I wrote through graduate school. 

Codes as m-files are stored in folder **mfiles**, folder **Xamples** provide example of usage in m-files for some of mine and Matlab functions. **workzone** is a temporary stroage for under construction files.

Detialed documentation please see each sub-directory.

## mfiles
### Ecology data analysis and modeling
Functions used in ecological data analysis and modeling. e.g. community analysis, biodiversity calculation.

* **association\_ind.m** : calculate association index
* **association\_ind\_bstr.m** :  calculate association index and bootstrap analysis
* **association\_ind\_bstr\_par.m** :  calculate association index and bootstrap analysis, accelerate using **parfor**
* **bio_diversity.m** : calculate biodiversity indices
* **bitemark.m** : transform bite mark count to estimated number of bite (where multiple bite cannot be distinguished).
* **bray_curtis.m** : 
* **checkerboard.m** : creating checkerboard landscape
* **disp_incidence.m** : simulate dispersal events (ref. Hanski & Woiwod, 1993)
* **plotTaylorFit.m** : function to fit Taylor's power law, and make plot.
* **TaylorFit.m** : function to fit Taylor's power law in community data.
* **work_bitemark.m** : Working and demo of function 
### Statistics utility and data handling in general
* **castdata.m** : put vector data into a matrix by assigned group
* **inlier.m** : function, remove outliers from vectors

* **meltdata** : Put each data in a matrix as a variable in a row ("an obseervation"), column id and row id as two other variables 
* **nancorr.m** : calculate correlation coefficient, ignore NaN in each pair
* **nangeomean.m** : calculate geometric mean with NaN removed. 
* **nanls.m** :  calculate ls parameters and r,p vlaue for correlation
* **nanzscore.m** : z-transform with NaNs. (remove NaN and pass parameters to matlab function **zscore**)
* **tcastdata** : put data from table into a matrix by assigned group
* **tnames.m** : show names of variable in a table
* **thead.m** show first few lines of table data 

### Making figures

* **auto_tick.m** : calculate tick mark location, used in other functions. 
* **mycolor** : function, pick color from a color plates, used in many plotting functions.
* **mycorrplot_1** : Plot the results of correlation (i.e. corr(X)) in a figure with table-like structure.
* **mycorrplot_2** : Plot the results of correlation (i.e. corr(X, Y)) in figures with table-like structure.
* **myplot** : make nice(r) scatterplot or line plot quickly
* **myplot_bar** :  make nice(r) barplot quickly
* **myplot_CI** : make plot to show data and canfidence interval 
* **myplot_ls** : Make scatter plot and ls line
* **myplotyy** : make nice(r) plotyy quickly
* **mysubplot** : Make subplot and add major/big title to the figure
* **plot_circle** : eazier way to make a circle
* **plot_square** : Make a square or box by imput x and y points


---
## Reference
>Hanski & Woiwod (1993) Spatial synchrony in the dynamics of moth and aphid populations

---
>#### Update notes
> * 2015/10/19 : edit fix tick mark problem in **myplot_CI.m**
> * 2015/10/20 : add **myplotyy.m**
> * 2015/10/28 : add **nanzscore.m** , edit **LS_combo**
> * 2015/10/29 : add **meltdata.m**, **tcastdata.m**, **castdata.m**,  **nangeomean.m**, **tnames.m**, fix bug in **myplot_bar**
> * 2015/10/30 : add **nancorr.m**, edit **mycorrplot_2.m**, **mycorrplot\_1.m**, **mycolor.m**. (Mainly compatibility with table data type)
> * 2015/10/31 : edit **X\_mycorrplot.m**, **myplotyy.m**, add **nanls.m**,**myplot\_ls** to replace **LS\_combo.m** and **plot\_linefit.m**
> * 2015/11/02 : edit  **mycorrplot_1.m**, **myplot.m**, transparency only work for version 2015a and newer.
> * 2015/11/05 : add **plotTaylorFit.m**, **TaylorFit.m**
> * 2015/11/11 : add **numInteraction.m**, **numInteraction_bootstrap.m**, **hline.m**, **colonization.m**; edit **myplot.m** add style option; edit **X_mycorrplot_2.m** include example of table input.