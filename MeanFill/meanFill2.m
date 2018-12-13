function [image] = meanFill2(k, m, l, n, x )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
width = 2;
while(k <= m && l <= n)
    for i = l:n
        if(x(k,i) == 0)
            temp = x(k - width: k + width, i-width:i+width);
            temp = temp(:);
            mean = sum(temp) ./ sum(temp~=0);

            x(k,i)  = mean;
        end
    end
    k = k + 1;  
    for i = k:m
        if(x(i,n) == 0)
            i-width : i + width
            n - width:n + width
            temp = x(i-width : i + width, n - width:n + width);
            temp = temp(:);
            mean = sum(temp) ./ sum(temp~=0);
            x(i,n) = mean;
        end
    end
    n = n - 1; 
    if(k <= m)
        for i = n  : -1 : l
            if(x(m,i) == 0)
                temp = x(m - width:m + width, i - width : i + width);
                temp = temp(:);
                mean = sum(temp) ./ sum(temp~=0);
                x(m, i) = mean;
            end
        end
        m = m -1; 
    end
    if(l <= n)
        for i = m : -1 : k
            if(x(i,l) == 0)
                temp = x(i - width: i + width, l - width: l + width);
                temp = temp(:);
                mean = sum(temp) ./ sum(temp~=0);
                x(i, l) = mean;
            end
        end
        l = l + 1; 
    end
end
image = x; 
end

