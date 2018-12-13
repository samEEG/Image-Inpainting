function [newImage] = meanFillFinal(image)
w = 5; 
for i = 1 + w : size(image, 1) - w
    for j = 1 + w : size(image, 2) - w
        if(image(i,j) == 0)
            temp = image(i - w: i + w, j - w: j + w);
            temp = temp(:);
            mean = sum(temp) ./ sum(temp~=0);
            image(i, j) = mean;
        end
    end
end
newImage = image; 

end

