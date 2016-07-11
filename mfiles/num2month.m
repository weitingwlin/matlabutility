function monthstr = num2month(monthnum)

    [n, p] = size(monthnum);
    for i = 1: n
            for j = 1: p
                monthstr(i, j) = n2mstr(monthnum(i,j));
            end
    end

    if  isscalar(monthnum)
        monthstr = monthstr{1};
    end
    
end

%% a subfunction
function  mstr =n2mstr(mnum)
monthStr1 = {'January', 'February', 'March', 'April', 'May',  'June',  ...
                    'July', 'August' ,'September','October', 'Novenber','December' };
                mstr = monthStr1(mnum);              
end