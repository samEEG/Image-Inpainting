clear; clc;

I1 = imread('beach.jpg');
grayImage = rgb2gray(imread('beach.jpg'));
% k = 190; 
% m = 213;
% l = 27; 
% n = 77;
k = 158; 
m = 191;
l = 54; 
n = 88;
imshow(grayImage);
%%
grayImage(k:m,l:n) = 0; 
imshow(grayImage);
%%
restoredImage = medianFill2(k,m,l,n,grayImage);
restoredImage2 = meanFill(k,m,l,n,grayImage);
imshow(restoredImage);
figure 
imshow(restoredImage2);
%% RUN THIS PART TO SEE RESULTS 
clear; clc;
X = imread('ship.jpg');
I1 = addtext(X);
figure
imshow(I1)

%%
restored(:,:,1) = meanFillFinal(I1(:,:,1));
restored(:,:,2) = meanFillFinal(I1(:,:,2));
restored(:,:,3) = meanFillFinal(I1(:,:,3));
figure
imshow(restored);
imshow(restoredImage2);
%% Redone 
clear; clc;

mseMatrix = []; 
for i = 4:4:60 
    old = imread('beach.jpg');
    I1 = addtext(old, i);
    k = 1; 
    m = size(I1,1);
    l = 1; 
    i
    n = size(I1,2);
    numberofDpixels = 0; 
    for a = 1:size(I1,1)
        for b = 1:size(I1,2)
            if(I1(a,b,1) == 0 && I1(a,b,2) == 0 && I1(a,b,3) == 0)
                numberofDpixels = numberofDpixels + 1; 
            end
        end
    end
    restored(:,:,1) = meanFillFinal(I1(:,:,1));
    restored(:,:,2) = meanFillFinal(I1(:,:,2));
    restored(:,:,3) = meanFillFinal(I1(:,:,3));
    err = immse(old,restored);
    mseMatrix = [mseMatrix;numberofDpixels, err];
end 
%% ALL RUN THIS PART FOR JUST TEXT 
close all; clc; clear;

X = imread('ship.jpg');
I1 = addtext(X);
figure
imshow(I1)

%%
restored(:,:,1) = meanFillFinal(I1(:,:,1));
restored(:,:,2) = meanFillFinal(I1(:,:,2));
restored(:,:,3) = meanFillFinal(I1(:,:,3));
imshow(restored)


