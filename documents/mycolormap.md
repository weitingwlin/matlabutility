# mycolormap

##### Making colormap from `mycolor` or input rgb code

 Depends on: [mycolor](https://github.com/weitingwlin/matlabutility/blob/master/documents/mycolor.md)

## Syntax

###  mymap = mycolormap(c, mode, c2);

*  **c**: the color of the full scale
   + Vector (length = 3), RGB tripletcode for colors. 
   + Or an interger, select a color from mycolors. (To see color plate, type mycolor, or check the document.)
   + or one of the strings:  'red', 'green', ... type `str2rgb` to see available color strings.
* **mode**: 
   + `mode = 1` (the default) for monotonic gradient
   + `mode = 2` for diverging (bipolar) gradient
* **c2**: the full scale color when mode = 2. default is the complementary color of c.
* **mymap**: a matrix of size 64 * 3, can be used as a [`colormap`](https://www.mathworks.com/help/matlab/ref/colormap.html)        

  


## Example: 
#### Specify the full scale color: from `mycolor`

	   A = [1 2 3 ; 4 5 6; 0 0 10]
       imagesc(A)
       colormap(mycolormap(3)); colorbar 

 ![plot1](images/mycolormap1.png)  

#### Specify the full scale color by name
       colormap(mycolormap('teal'));
          % this is equal to 
          %    colormap(mycolormap(str2rgb('teal')));


 ![plot1](images/mycolormap2.png)  

#### Specify the full scale color by RGB code
       colormap(mycolormap([1 0.5 0]))
        % this is equal to
        %   colormap(mycolormap('orange'));

 ![plot1](images/mycolormap3.png)  

#### Using a bipolar map
       rng(1);
       B = randn(5); 
       colormap(mycolormap('blue', 2, 'orange')); colorbar

 ![plot1](images/mycolormap4.png)  

