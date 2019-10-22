function [imgMatrix] = readTifStackToMatrix(pathname, verbose)
%% Author Sagar Setru, 1 October 2014
% Takes the TIF image stack specified by complete
% path pathname and converts it into a 3D image matrix
%
% Input: pathname: string of complete path that includes the filename
%        verbose: binary value, if 1, will print progress
%
% Output: imgMatrix: 3D image matrix
%%

if nargin == 2,
    fileInfo = imfinfo(pathname);
    numImages = numel(fileInfo);
    imgMatrix = zeros(fileInfo(1).Width,fileInfo(1).Height,numImages);
    for k = 1:numImages,
        if verbose,
            disp(['Loading slice ',num2str(k),' out of ',num2str(numImages)])
        end
        imgMatrix(:,:,k) = imread(pathname,k,'Info',fileInfo);
    end
end

if nargin == 1,
    fileInfo = imfinfo(pathname);
    numImages = numel(fileInfo);
    imgMatrix = zeros(fileInfo(1).Height,fileInfo(1).Width,numImages);
    for k = 1:numImages,
        imgMatrix(:,:,k) = imread(pathname,k,'Info',fileInfo);
    end
end
