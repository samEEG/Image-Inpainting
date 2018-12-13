function [ image ] = addtext2( X, font )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


t = text(.05,.1,'Inpainting','FontSize',font,'FontWeight','bold');
F = getframe(gca,[10 10 100 100]);
close all; 
c = F.cdata(:,:,1);
[i,j] = find(c==0);
ind = sub2ind(size(X),i,j);
X1 = X(:,:,1);
X2 = X(:,:,2);
X3 = X(:,:,3);
X1(ind) = uint8(0);
X2(ind) = uint8(0);
X3(ind) = uint8(0);
X(:,:,1) = X1; 
X(:,:,2) = X2; 
X(:,:,3) = X3; 
image = X; 

end
