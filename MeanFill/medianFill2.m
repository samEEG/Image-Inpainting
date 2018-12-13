function [ image ] = medianFill2( k, m, l, n, x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


while(k <= m && l <= n)
    for i = l:n
        temp = x(k - 1, i-1:i+1);
        temp = median(temp(:));
        
        x(k,i)  = temp;
    end
    k = k + 1;  
    for i = k:m
        temp = x(i-1 : i + 1, n + 1);
        temp = median(temp(:));
        x(i,n) = temp;
    end
    n = n - 1; 
    if(k <= m)
        for i = n  : -1 : l
            temp = x(m + 1, i - 1 : i + 1);
            temp = median(temp(:));
            
            x(m, i) = temp;
        end
        m = m -1; 
    end
    if(l <= n)
        for i = m : -1 : k
            temp = x(i - 1: i + 1, l - 1);
            temp = median(temp(:));
            x(i, l) = temp;
        end
        l = l + 1; 
    end
end
image = x; 
end

