%% Main: HUJI example
% Here we calculate a single subject's correlations between the
% quantitative and the semi-quantitative quantifiers.

load(fullfile(nii_dir,'TEs.mat'),'TE_PD','TE_T2') 
T1w = readNifti(fullfile(nii_dir,'T1w.nii.gz'));
T2w = readNifti(fullfile(nii_dir,'T2w.nii.gz'));
PDw = readNifti(fullfile(nii_dir,'PDw.nii.gz'));
B0 = readNifti(fullfile(nii_dir,'B0.nii.gz'));
BM1 = readNifti(fullfile(nii_dir,'mask.nii.gz'));
T1woverT2w = readNifti(fullfile(nii_dir,'T1woverT2w.nii.gz'));
T1woverPDw = readNifti(fullfile(nii_dir,'T1woverPDw.nii.gz'));
lnT2woverPDw = double(readNifti(fullfile(nii_dir,'lnT2woverPDw.nii.gz')));

BM1(:,:,1:20)=0;     % don't take edges - only real values       
BM1(:,:,47:end)=0;
BM=BM1;

R1 = readNifti(fullfile(nii_dir,'R1.nii.gz'));
R2 = readNifti(fullfile(nii_dir,'R2.nii.gz'));
seg = readNifti(fullfile(nii_dir,'seg.nii.gz'));

R2w = 1./double(T2w);
lnR2w = log(R2w).*(TE_PD-TE_T2);
lnT1woverT2w = log(double(T1woverT2w));
T1woverlnT2w = T1w./log(double(T2w));

% get rid of extreme values:
mT1w = cutoff_mask(T1w,seg,BM);
mR2w = cutoff_mask(R2w,seg,BM);
mT1woverPDw = cutoff_mask(T1woverPDw,seg,BM);
mT1woverT2w = cutoff_mask(T1woverT2w,seg,BM);
mlnT2woverPDw = cutoff_mask(lnT2woverPDw,seg,BM);
mR1 = cutoff_mask(R1,seg,BM);
mR2 = cutoff_mask(R2,seg,BM);

mask_all1 = ones(size(BM));
mask_all2 = ones(size(BM));
mask_all1(mR1==0)=0;
mask_all2(mR2==0)=0;
mask_all1(mT1w==0)=0;
mask_all2(mR2w==0)=0;
mask_all1(mT1woverPDw==0)=0;
mask_all1(mT1woverT2w==0)=0;
mask_all2(mT1woverT2w==0)=0;
mask_all2(mlnT2woverPDw==0)=0;

R_T1w_R1 = Rmdl(T1w(mask_all1==1),R1(mask_all1==1));
R_T1woverPDw_R1 = Rmdl(T1woverPDw(mask_all1==1),R1(mask_all1==1));
R_T1woverT2w_R1 = Rmdl(T1woverT2w(mask_all1==1),R1(mask_all1==1));
R_lnT1woverT2w_R1 = Rmdl(lnT1woverT2w(mask_all1==1),R1(mask_all1==1));
R_T1woverlnT2w_R1 = Rmdl(T1woverlnT2w(mask_all1==1),R1(mask_all1==1));

R_R2w_R2 = Rmdl(R2w(mask_all2==1),R2(mask_all2==1));
R_ln_T2woverPDw_R2 = Rmdl(lnT2woverPDw(mask_all2==1),R2(mask_all2==1));
R_T1woverT2w_R2 = Rmdl(T1woverT2w(mask_all2==1),R2(mask_all2==1));
R_ln_T1woverT2w_R2 = Rmdl(lnT1woverT2w(mask_all2==1),R2(mask_all2==1));
R_ln_R2w_R2 = Rmdl(lnR2w(mask_all2==1),R2(mask_all2==1));
R_T1woverlnT2w_R2 = Rmdl(T1woverlnT2w(mask_all2==1),R2(mask_all2==1));


%% Functions:
function [mat] = readNifti(path)
    mat = readFileNifti(path);
    mat = mat.data;
end

function Rsquared = Rmdl(vec1,vec2)
    mdl = fitlm(vec1,vec2);
    Rsquared = mdl.Rsquared.Ordinary;
end
