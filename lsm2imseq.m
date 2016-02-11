function [] = lsm2imseq(directory_name)

%% LSM I/O to tiff image sequence
% This is a function for rapidly processing a folder full of LSM files. It
% takes all the files, reads them into matlab, applies a gaussian filter
% with sigma 0.7, and writes the files as an image sequence of tiff
% files.

% Currently set up to work only on fixed images, as these are the type
% where we tend to have lots of images that need parallel processing



%% Grab filenames
[fileNames] = filename_reader(directory_name);
for i = 1:length(fileNames)
    pathname{i} = strcat(directory_name,fileNames{i});
    noSuffixPathName{i} = lsm_stripper(pathname{i});
end
    

%% Open, filter, and close files

for i = 1:length(pathname)
    stack = lsmread(pathname{i})
    nosuffixfilename = lsm_stripper(fileNames{i})
    mkdir(strcat(noSuffixPathName{i},'/'))
    
    for z = 1:length(stack)
        if z <10 
            zstr = strcat('_z00',num2str(z));
        else
            zstr = strcat('_z0',num2str(z));
        end
        
        red = gaussfilt(stack(z).red,0.7);
        green = gaussfilt(stack(z).green,0.7);
        blue = gaussfilt(stack(z).blue,0.7);
       
        
        imwrite(red,strcat(noSuffixPathName{i},'/',nosuffixfilename,zstr,'_c001.tif'));
        imwrite(green,strcat(noSuffixPathName{i},'/',nosuffixfilename,zstr,'_c002.tif'));
        imwrite(blue,strcat(noSuffixPathName{i},'/',nosuffixfilename,zstr,'_c003.tif'));
        
        clear red green blue
    end
    
end
