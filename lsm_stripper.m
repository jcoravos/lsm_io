function [ outstring ] = lsm_stripper( instring )
%strip the .lsm suffix of a file. Only works for filenames that lack '.'
%   Detailed explanation goes here

[name,a] = strsplit(instring,'.');
outstring = name{1};

end

