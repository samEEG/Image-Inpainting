clear; clc; close all;
DIS = 1:10; 
Size = [9 25 49 81 121 169 255 289 361 441]; % Window size 
u_t = [7 8 9 10 12 14 16 18 20 22];          % percentage of useful pixels inside window 
lamda_t = [20 22 24 26 28 30 32 34 36 38];   % percentage of noise pixels inside window
%% RUN this part here 
close all; clc; clear;

X = imread('beach.jpg');
I1 = addtext(X);
figure
imshow(I1)
%%
figure
restored = impaint2(I1);
imshow(restored)
%% THIS IS TO GET MSE VALUES 
clear; clc;

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
    image = impaint2(X);
    err = immse(old,image);
    mseMatrix = [mseMatrix;numberofDpixels, err];
end 





