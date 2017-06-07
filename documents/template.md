# mytext

##### Facilitate the use of `text` function

## Syntax

### mytext(x, y, textin, fsize, Halign, Valign, textcolor, fontname)

### mytext(x, y, textin, fsize, align_code, [], textcolor, fontname)

*  **x, y**: x, y coordinates passed to `text`
*  **textin**: the text (in "") content passed to `text`. The `textin` will be transformed by `sprintf` function, so expressions like `\n`, `\t`, and **Unicode** will work.
*  **Halign**: the `HorizontalAlignment`, can take 

![plot1](images/mytext_1.png) 

  


## Example: 
Make a plot nice and quick:

		x=1:50;
		rng(1); y=rand(1,50);
    myplot(x,y)
  
 
 
## References:
* [Unicode characters](https://unicode-table.com/en/#basic-latin)
* [another Unicode reference](http://www.rapidtables.com/code/text/unicode-characters.htm)
* [Matlab `sprintf`](https://www.mathworks.com/help/matlab/ref/sprintf.html#inputarg_formatSpec) 