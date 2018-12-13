function [ image ] = addtextGray( X )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


t = text(.05,.1,'Inpainting','FontSize',10,'FontWeight','bold');
F = getframe(gca,[10 10 110 110]);
close all; 
c = F.cdata(:,:,1);
[i,j] = find(c==0);
ind = sub2ind(size(X),i,j);
X1 = X(:,:,1);
X1(ind) = uint8(0);

X(:,:,1) = X1; 

image = X; 

end
