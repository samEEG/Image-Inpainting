function [ window ] = getWindow( image, i , j, length )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

p1 = i - (length - 1)/2;
p2 = i + (length - 1)/2;
p3 = j - (length - 1)/2;
p4 = j + (length - 1)/2;
window = image(p1:p2,p3:p4,1);

end
