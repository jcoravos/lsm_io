function [ stack ] = lsmread( filename )
%lsmread wraps tiffread2, and gets rid of the weird extra downsampled
%images
%   Detailed explanation goes here

[prestack,~] = tiffread2(filename);
stack = prestack(1:2:length(prestack));

end

