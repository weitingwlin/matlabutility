# Matlab utility codes

This is a collection of matlab functions and examples ("primers") I wrote through graduate school. 

Codes as m-files are stored in folder **mfiles**, folder **Xamples** provide example of usage in m-files for some of mine and Matlab functions. **workzone** is a temporary stroage for under-construction files. Folder **documents** contains detailed documents for some functions.

Detialed documentation please see each sub-directory.

## mfiles 

### Ecology data analysis and modeling
Functions used in ecological data analysis and modeling. e.g. community analysis, biodiversity calculation.

### Statistics utility and data handling in general
Mainly convinient functions dealing with **NaN**, and used in exploratery data analysis. 

### Making figures
Plotting functions that produced nice figures faster.



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
> * 2015/11/11 : add **numInteraction.m**, **numInteraction\_bootstrap.m**, **hline.m**, **colonization.m**; edit **myplot.m** add style option; edit **X\_mycorrplot_2.m** include example of table input.
> * 2015/11/12 : add **covcc.m**, **aggregation.m**
> * 2015/11/23 : add documentation for **mycolor.m**, **myplot.m**, Edit **myplot.m**,**myplott.m**
> * 2015/11/24 : add **vline.m**
> * 2015/12/01 : add **myplot_vec.m**; edit **myplot.m**
> * 2015/12/02 : add **mystyle.m**, add documentation for **myplot_vec.m**, **mystyle.m**.
> * 2015/12/05 : add **template_README.md**, **scriptRitual.md**; edit **numInteraction.m**
> * 2016/01/04 : add **explore_ttest.m**
> * 2016/01/28 : add **randeval.m**, edit **disp_incidence.m**
> * 2016/02/02 : add **nanste.m**, edit **tri2line.m**
> * 2016/02/03 : add **hotellingT2.m**,**subset.m**
> * 2016/02/29 : add **vmeanSE.m**
> * 2016/03/01 : add (moved from **workzone**) **association_ind.m**
> * 2016/03/31 : add **mylottery.m**
> * 2016/04/05 : add **fisher_alpha.m**
> * 2016/06/18 : add **groupmean.m**, **num2month.m**