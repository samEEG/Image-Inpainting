function [ image ] = medianFill(k, m, l, n, x)

% k starting row index 
% m - ending row index 
% l - starting column index 
% n - ending column index
image = x; 
while(k <= m && l <= n)
    for i = l:n
        % 3 pixel median 
        temp = x(k - 1, i - 1: i + 1);
        temp = cast(median(temp(:)),'uint8');
        image(k,i) = temp;
        image(k,i)
    end
    k = k + 1;  
    for i = k:m
        temp = x(i-1:i+1, n + 1);
        temp = cast(median(temp(:)),'uint8');
        image(i,n) = temp; 
    end
    n = n - 1; 
    if(k <= m)
        for i = n  : -1 : l
            temp = x(m + 1 , i - 1 : i + 1); 
            temp = cast(median(temp(:)),'uint8');
            image(m, i) = temp; 
        end
        m = m -1; 
    end
    if(l <= n)
        for i = m : -1 : k
            temp = x(i - 1: i + 1, l - 1);
            temp = cast(median(temp(:)),'uint8');
            image(i, l) = temp;
        end
        l = l + 1; 
    end
end
end

