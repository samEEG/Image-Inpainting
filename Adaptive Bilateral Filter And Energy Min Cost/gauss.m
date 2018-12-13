function [filteredImage] = gauss(image, sigma, w)
    %Truncate at 1 % 
    radius = ceil(sqrt(2*sigma^2*log(100))); 
    x = [-radius:radius];
    [X,Y] = meshgrid(x, x);
    g = exp(-(X.^2 + Y.^2)/(2*(sigma)^2));
    g = g/sum(g(:)); 
    filteredImage = conv2(image,g,'valid');  
end