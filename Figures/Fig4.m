%% Fig. 4:

load('MPRAGE_T2_space_all_subs_HBM.mat');

fontsize = 16;

figure(2);
nBins=200;
subplot(2,3,1);
plothist(nBins,T1woverT2w_all1,R1_all,fontsize);
xlabel('T1w/T2w [a.u.]'); ylabel('R1 [S^-^1]')

subplot(2,3,2);
plothist(nBins,lnT1woverT2w_all1,R1_all,fontsize);
xlabel('ln(T1w/T2w) [a.u.]'); 

subplot(2,3,3);
plothist(nBins,T1woverlnT2w_all1,R1_all,fontsize);
xlabel('T1w/ln(T2w) [a.u.]'); 

subplot(2,3,4);
plothist(nBins,T1woverT2w_all2,R2_all,fontsize);
xlabel('T1w/T2w [a.u.]'); ylabel('R2 [S^-^1]')

subplot(2,3,5);
plothist(nBins,lnT1woverT2w_all2,R2_all,fontsize);
xlabel('ln(T1w/T2w) [a.u.]'); 

subplot(2,3,6);
plothist(nBins,T1woverlnT2w_all2,R2_all,fontsize);
xlabel('T1w/ln(T2w) [a.u.]'); 