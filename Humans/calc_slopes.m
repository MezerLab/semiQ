function slope_struct = calc_slopes(map1_path, map2_path, BM_path, seg_data,C,norm)
% This function recieves two maps and some sort of segmentation, and uses
% binning method to extract the slopes between the two maps, for each ROI
% in the segmentation.
% 
% INPUT:
%       map1_path - the path to the first image, which will be the y-axis.
%       map2_path - the path to the second image, which will be the x-axis.
%       BM_path - the path to a brain mask.
%       seg_data - the path to a FreeSurfer segmentation file.
%       C - a vector that contains the ROIs as they are specified by
%       FreeSurfer.
%       norm - a flag (0/1) that requires normalization of the maps. 
% 
% OUTPUT:
%       slope_struct - a structure that contains the information about the
%       inputs, as well as the output relaxivities.

slope_struct = struct;

slope_struct.map1_path = map1_path;
map1 = readFileNifti(slope_struct.map1_path);
map1 = double(map1.data);

slope_struct.map2_path = map2_path;
map2 = readFileNifti(slope_struct.map2_path);
map2 = double(map2.data);

BM = readFileNifti(BM_path);
BM = double(BM.data);

slope_struct.seg_path = seg_data;
seg = combine_segs_for_relaxivity(seg_data);
slope_struct.seg = seg;
slope_struct.C = C;

mask_all = BM;
mask1 = cutoff_mask(map1,slope_struct.seg,mask_all);
mask2 = cutoff_mask(map2,slope_struct.seg,mask_all);
mask_all(mask1==0)=0;
mask_all(mask2==0)=0;

norm1 = median(map1(mask_all==1));
norm2 = median(map2(mask_all==1));

% normalization to the median:
if norm==1
    map1(mask_all==0)=0;
    map2(mask_all==0)=0;
    map1 = map1./norm1;
    map2 = map2./norm2;
end

[slope_struct]=calc_slopes_fit_manual_bins(slope_struct,map1,map2); 
