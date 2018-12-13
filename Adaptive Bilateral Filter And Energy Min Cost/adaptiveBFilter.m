function [newImage] = adaptiveBFilter(image,g, frameWidth, sigma)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

for i = 1 + frameWidth: size(image,1) - frameWidth 
    for j = 1 + frameWidth: size(image,2) - frameWidth
        sigmaR = 1; 
        if(image(i,j) == 0)
            window = getWindow( image, i , j, frameWidth);
            fwindow = fft2(window);
            fg = fft2(g); 
            py = ifft2(fg.*fwindow);
            px = py((frameWidth + 1)/2,(frameWidth + 1)/2 );
            tx = calculateT(px, py, window);
            %Adjest range of sigma for rnage portion of filter 
            sigmaR = sigma*tx;
            BFilter=exp(-double(window - px).^2/(2*sigmaR^2))*g;
            %Find Bx and divide by norm 
            norm=sum(BFilter(:));
            Bx=sum(sum(BFilter.*double(py)));
            Bx = Bx/norm;
            %Finder the pixel value that gives the lowest energy 
            y = energyFinder(image,px, Bx, sigmaR ,g, frameWidth, i , j);
           
%              if(y == 0)
%                 temp = image(i -3:i+3,j-3:j+3);
%                 temp = temp(:)
%                 m = sum(temp) ./ sum(temp~=0);
%                 y = m;
%              end
              image(i,j) = y; 
              
        end
    end
end
newImage = image;
end

