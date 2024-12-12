function [] = division_imgs(nii_dir)

% Creating the division images for humans. This function recieves a
% directory that contains all images (in the same space and resolution) and
% saves new division images in the same directory. This is done for a
% single subject.
% 
% INPUTS:
%       nii_dir - a directory that contains the following names:
%               T1w.nii.gz - A T1w nifti file (MPRAGE)
%               T2w.nii.gz - A T2w nifti file
%               PDw.nii.gz - A PDw nifti file
%               B0.nii.gz - A diffusion B0 nifti file
%               mask.nii.gz - A nifti file of a mask (either FreeSurfer
%               mask or synthstrip
%               TEs.mat - saved values of echo times of T2 and PD
%       
% 
% 
% 
% 
% 
% 

T1w = readFileNifti(fullfile(nii_dir,'T1w.nii.gz'));
T2w = readNifti(fullfile(nii_dir,'T2w.nii.gz'));
PDw = readNifti(fullfile(nii_dir,'PDw.nii.gz'));
B0 = readNifti(fullfile(nii_dir,'B0.nii.gz'));
BM = readNifti(fullfile(nii_dir,'mask.nii.gz'));
xform = T1w.qto_xyz;
T1w = T1w.data;
load(fullfile(nii_dir,'TEs.mat'),'TE_PD','TE_T2') 

T1woverT2w_path = fullfile(nii_dir,'T1woverT2w.nii.gz');
T1woverlnT2w_path = fullfile(nii_dir,'T1woverlnT2w.nii.gz');
T1woverPDw_path = fullfile(nii_dir,'T1woverPDw.nii.gz');
lnT2woverPDw_path = fullfile(nii_dir,'lnT2woverPDw.nii.gz');


if ~isfile(T1woverT2w_path)
    T1woverT2w = T1w;
    T1woverT2w(BM==1) = double(T1w(BM==1))./double(T2w(BM==1));
    T1woverT2w(BM==0) = 0;
    dtiWriteNiftiWrapper(T1woverT2w,xform,T1woverT2w_path);
end
if ~isfile(T1woverlnT2w_path)
    T1woverlnT2w = T1w;
    T1woverlnT2w(BM==1) = double(T1w(BM==1))./log(double(T2w(BM==1)));
    T1woverlnT2w(BM==0) = 0;
    dtiWriteNiftiWrapper(T1woverlnT2w,xform,T1woverlnT2w_path);
end
if ~isfile(T1woverPDw_path)
    T1woverPDw = T1w;
    T1woverPDw(BM==1) = double(T1w(BM==1))./double(PDw(BM==1));
    T1woverPDw(BM==0) = 0;
    dtiWriteNiftiWrapper(T1woverPDw,xform,T1woverPDw_path);
end
if ~isfile(lnT2woverPDw_path)
    lnT2woverPDw = T2w;
    lnT2woverPDw(BM==1) = log(double(T2w(BM==1))./double(PDw(BM==1))).*(TE_PD-TE_T2);
    lnT2woverPDw(BM==0) = 0;
    dtiWriteNiftiWrapper(lnT2woverPDw,xform,lnT2woverPDw_path);
end

function [mat] = readNifti(path)
    mat = readFileNifti(path);
    mat = mat.data;
end

end
