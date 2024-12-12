%% Bland-Altman plots

load("MPRAGE_T2_space_all_subs_HBM.mat");

%% Z-score to the population:
R1_all = zscore(R1_all);
T1w_all = zscore(T1w_all);
T1woverT2w_all1 = zscore(T1woverT2w_all1);
T1woverPDw_all = zscore(T1woverPDw_all);
R2_all = zscore(R2_all);
R2w_all = zscore(R2w_all);
T1woverT2w_all2 = zscore(T1woverT2w_all2);
lnT2woverPDw_all = zscore(lnT2woverPDw_all);

%% Bland-Altman plot:

X = [0 2.5];
Y = [-1 1.5];
X = [-3 2.5];
Y = [-2 2];

figure;
subplot(2,3,1)
method1 = T1w_all;
method2 = R1_all;
method_names = {'T1w';'R1'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
subplot(2,3,2)
method1 = T1woverT2w_all1;
method2 = R1_all;
method_names = {'T1w/T2w';'R1'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
subplot(2,3,3)
method1 = T1woverPDw_all;
method2 = R1_all;
method_names = {'T1w/PDw';'R1'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
subplot(2,3,4)
method1 = R2w_all;
method2 = R2_all;
method_names = {'R2w';'R2'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
subplot(2,3,5)
method1 = T1woverT2w_all2;
method2 = R2_all;
method_names = {'T1w/T2w';'R2'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
subplot(2,3,6)
method1 = lnT2woverPDw_all;
method2 = R2_all;
method_names = {'ln(T2w/PDw)';'R2'};
blandAltman(method1,method2,method_names)
xlim(X); ylim(Y);
