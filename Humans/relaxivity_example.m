%% Relaxivity
% Here we calculate a single subject's relaxivities across ROIs.

roi_names = {'Thalamus', 'Caudate', 'Putamen', 'Pallidum', 'Hippocampus'...
    'Amygdala', 'CTX - frontal', 'CTX - parietal', 'CTX - temporal',...
    'CTX - occipital', 'WM - frontal', 'WM - parietal',...
    'WM - temporal', 'WM - occipital'}';
C = [10,11,12,13,17,18,1028,1029,1030,1011,3028,3029,3030,3011];

seg_path = fullfile(nii_dir,'seg.nii.gz');
mask_path = fullfile(nii_dir,'mask.nii.gz');
T1w_path = fullfile(nii_dir,'T1w.nii.gz');
T2w_path = fullfile(nii_dir,'T2w.nii.gz');
PDw_path = fullfile(nii_dir,'PDw.nii.gz');
R1_path = fullfile(nii_dir,'R1.nii.gz');
PD_path = fullfile(nii_dir,'PD.nii.gz');
R2_path = fullfile(nii_dir,'R2.nii.gz');
lnT2woverPDw_path = fullfile(nii_dir,'lnT2woverPDw.nii.gz');
T1woverPDw_path = fullfile(nii_dir,'T1woverPDw.nii.gz');

dPDdR1 = calc_slopes(R1_path, PD_path, mask_path, seg_path,C,0);
dPDwdT1woverPDw = calc_slopes(T1woverPDw_path, PDw_path, mask_path, seg_path,C,1);
dR2dPD = calc_slopes(R2_path, PD_path, mask_path, seg_path,C,0);
dlnT2woverPDwdPDw = calc_slopes(lnT2woverPDw_path, PDw_path, mask_path, seg_path,C,1);

dPDdR1fit = squeeze(dPDdR1.fit(1,:,1));
dPDwdT1woverPDwfit = squeeze(dPDwdT1woverPDw.fit(1,:,1));
dR2dPDfit = squeeze(dR2dPD.fit(1,:,1));
dlnT2woverPDwdPDwfit = squeeze(dlnT2woverPDwdPDw.fit(1,:,1));