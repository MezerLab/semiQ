function mask = cutoff_mask(img,seg,mask)
% This function recieves an image, a segmentation and a mask, and uses a
% personalized cutoff based on the image's histogram, and outputs an
% adjusted mask.
%
% INPUTS:
%       img - either a matrix or a path to a nifti file of the image.
%       seg - a matrix of the FreeSurfer segmentation of the image.
%       mask - a matrix with 1 where there is brain, and 0 where there's no
%       brain.
% 
% OUTPUTS:
%       mask - the adjusted mask matrix.

    if ~isnumeric(img)
        img = readFileNifti(img);
        img = img.data;
    end

    mask(seg==4) = 0;
    mask(seg==43) = 0;
    mask(abs(img)==Inf) = 0;
    mask(img==0) = 0;

    img(mask==0)= NaN;
    Y = prctile(img(:),[2,97]);
    mask(img<Y(1) | img>Y(2)) = 0;
end
