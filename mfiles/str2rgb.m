%%
function rgbcode = str2rgb(c)
                A.red = [1, 0, 0];  A.blue = [0 0 1];  A.green = [0 1 0]; 
                A.purple = (red + blue)/2;
                A.olive =(red + green)/2;
                A.teal =(blue + green)/2;
                A.orange = [1, 0.5, 0];
        if any(strcmp(c, {'red', 'green', 'blue', 'purple', 'teal', 'olive', 'orange'}))
             rgbcode = A.(c);   
        else
             error('input string should be one of: red, green, blue, purple, teal, olive');
        end
end 
