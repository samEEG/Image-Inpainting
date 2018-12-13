function [ g ] = chnageG( g, frame )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[row,col] = find(frame == 0);
for i = 1:size(row,1)
    g(row(i), col(i)) = 0; 
end

end

