%%Run this and next two 
close all; clc; clear;

image = rgb2gray(imread('beach.jpg'));
image = addtextGray(image);
imshow(image)
frameWidth = 7; 
x = [-(frameWidth - 1)/2:(frameWidth -1 )/2];
sigma = .5; 
[X,Y] = meshgrid(x, x);
g = exp(-(X.^2 + Y.^2)/(2*(sigma)^2));
g = g/sum(g(:));
figure
imagesc(g);
colormap gray
%%
close all; 
image = imread('beach.jpg');
image = addtext(image);
imshow(image)
%%
newImage(:,:,1) = adaptiveBFilter(image(:,:,1),  g, frameWidth, sigma);
newImage(:,:,2) = adaptiveBFilter(image(:,:,2),  g, frameWidth, sigma);
newImage(:,:,3) = adaptiveBFilter(image(:,:,3),  g, frameWidth, sigma);
figure
imshow(newImage);
%%
mseMatrix = []; 
for i = 4:4:60 
    i
    old = imread('beach.jpg');
    X = addtext2(old, i);
    numberofDpixels = 0; 
    for a = 1:size(X,1)
        for b = 1:size(X,2)
            if(X(a,b,1) == 0 && X(a,b,2) == 0 && X(a,b,3) == 0)
                numberofDpixels = numberofDpixels + 1; 
            end
        end
    end
    newImage(:,:,1) = adaptiveBFilter(X(:,:,1),  g, frameWidth, sigma);
    newImage(:,:,2) = adaptiveBFilter(X(:,:,2),  g, frameWidth, sigma);
    newImage(:,:,3) = adaptiveBFilter(X(:,:,3),  g, frameWidth, sigma);
    err = immse(old,newImage);
    mseMatrix = [mseMatrix;numberofDpixels, err];
end 