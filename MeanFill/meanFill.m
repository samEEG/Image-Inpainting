function [ image ] = meanFill( k, m, l, n, x )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

width = 5;
while(k <= m && l <= n)
    for i = l:n
        temp = x(k - width: k + width, i-width:i+width);
        temp = temp(:);
        mean = sum(temp) ./ sum(temp~=0);
        
        x(k,i)  = mean;
    end
    k = k + 1;  
    for i = k:m
        temp = x(i-width : i + width, n - width:n + width);
        temp = temp(:);
        mean = sum(temp) ./ sum(temp~=0);
        x(i,n) = mean;
    end
    n = n - 1; 
    if(k <= m)
        for i = n  : -1 : l
            temp = x(m - width:m + width, i - width : i + width);
            temp = temp(:);
            mean = sum(temp) ./ sum(temp~=0);
            
            x(m, i) = mean;
        end
        m = m -1; 
    end
    if(l <= n)
        for i = m : -1 : k
            temp = x(i - width: i + width, l - width: l + width);
            temp = temp(:);
            mean = sum(temp) ./ sum(temp~=0);
            x(i, l) = mean;
        end
        l = l + 1; 
    end
end
image = x; 
end

