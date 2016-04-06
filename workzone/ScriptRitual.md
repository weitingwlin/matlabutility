## Matlab
#### Initializing a project
* **README** : add a **README.md** file, with a short description of project and a list of all other files and a short description for each. 
* **Set path** : Start a porject with **work_setup.m** : `cd` to current folder (machine specific) and load tools (`addpath`).
 
#### Data
* Save data in folder **data** :
	+ raw data in subfolder **rawdata**
	+ left only the analytical data out in the **data** folder
* with a **script_compile.m** : compile data from raw data and save analytical data in tabulate form as **.txt** or **.csv**.

#### The rest of scripts
* **Work files** : Work files save the work flow. Contain the code to explore the data, do analysis, and creat the **resuts** (e.g. make figures). Until the project is down, these are the codes responsible for **reprocucibility**. Start with a section that load analytical data. Use prefix **work_** .

* **Functions** : Only keep the project-specific function in the project folder. If a function serve more general purpose, move to the utility folder. Functions do not need prefix.

* **Scripts** : Scripts files contain scripts that doesn't need a lot change after written. More often are temporary. Could be reusable chunck in **Work files** Use prefix **script_**. 