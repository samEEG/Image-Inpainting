function [minMatrix] = energyFinder(image,px, Bx, sigma_r,g,w,r,c)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

%Ey = lamda||uy - px|| + (1+lamda)||By - Bx||;
window_size = w; 
lamda = .80; 
minMatrix = []; 
minValue = 10000000;
s = 3;
for i=r - s: r + s
    for j= c -s :c +s
        
        %Adjusting the window size

        I = image(i - 3:i + 3, j-3:j + 3);
        range=exp(-double(I-image(i,j)).^2/(2*sigma_r^2)); % Range filter
        
        %Taking the product of the range and domain filter.The combination is refered to as Bilater Filter
        BFilter=range.*g;
        norm=sum(BFilter(:));
        %normalize the output
        By=sum(sum(BFilter.*double(I)))
        By = By/norm; 
        %Equation 5 
        Ey = lamda * (I - px).^2 + (1-lamda) * (By - Bx).^2;
        if(sum(sum(Ey)) < minValue)
            minValue = sum(sum(Ey)); 
            minMatrix = image(i,j); 
        end
        minMatrix;
        
    end

end

