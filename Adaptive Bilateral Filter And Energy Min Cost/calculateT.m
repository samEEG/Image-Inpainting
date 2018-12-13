function [ t ] = calculateT( px, py, frame )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[row, col] = find(frame == 0);

temp = (double(py) - px)^2;

sumOfIndexWith0 = 0; 
for i = 1: size(row,1)
    sumOfIndexWith0 = sumOfIndexWith0 + py(row(i), col(i));
end

Fnorm=sum(temp(:));
t = (sum(sum(temp)) - sumOfIndexWith0) / Fnorm;
end

